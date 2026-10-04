#!/usr/bin/env python3
"""Generate SQLite seed files (schema.sql + data.sql) from database/backup.sql.

- Converts the MySQL dump into SQLite DDL + INSERT statements.
- Every SQL statement is emitted on ONE line, so the simple statement
  splitter inside util/DB.java works even when text contains semicolons.
- Idempotent: schema uses CREATE TABLE IF NOT EXISTS; data.sql deletes
  existing rows first, so re-seeding never duplicates data.

Usage: python tools/make_seed.py
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'src', 'main', 'webapp', 'database', 'backup.sql')
OUT_DIR = os.path.join(ROOT, 'src', 'main', 'resources', 'seed')

INT_RE = re.compile(r'^(big)?int(\(\d+\))?$', re.I)

# r_interview_schedule in the old MySQL DB was replaced by the
# interview_schedule table the application actually uses.
TABLE_RENAMES = {'r_interview_schedule': 'interview_schedule'}

# r_interview_schedule.java inserts columns (a_id, candudate_name, ...) that
# the old dump table never had - use the schema the application actually needs.
SCHEMA_OVERRIDES = {
    'interview_schedule': (
        'CREATE TABLE IF NOT EXISTS "interview_schedule" ( "interview_id" INTEGER PRIMARY KEY AUTOINCREMENT, "a_id" TEXT, "candudate_name" TEXT, "interview_time" TEXT, "interview_date" TEXT, "interview_location" TEXT, "status" TEXT );',
        ['interview_id', 'a_id', 'candudate_name', 'interview_time', 'interview_date', 'interview_location', 'status']),
}


def split_top_level_commas(s):
    parts, depth, cur, in_str = [], 0, [], False
    for ch in s:
        if ch == "'":
            in_str = not in_str
            cur.append(ch)
        elif ch == '(' and not in_str:
            depth += 1
            cur.append(ch)
        elif ch == ')' and not in_str:
            depth -= 1
            cur.append(ch)
        elif ch == ',' and depth == 0 and not in_str:
            parts.append(''.join(cur).strip())
            cur = []
        else:
            cur.append(ch)
    if cur:
        parts.append(''.join(cur).strip())
    return parts


def parse_statements(text):
    """Split SQL text on ; while respecting single-quoted strings."""
    statements, cur, in_str = [], [], False
    for ch in text:
        if ch == "'":
            in_str = not in_str
            cur.append(ch)
        elif ch == ';' and not in_str:
            statements.append(''.join(cur))
            cur = []
        else:
            cur.append(ch)
    if cur:
        statements.append(''.join(cur))
    return [s for s in statements if s.strip()]


def strip_comments_and_noise(text):
    text = re.sub(r'/\*![\s\S]*?\*/;?', '', text)   # /*!40101 ... */ directives
    text = re.sub(r'/\*[\s\S]*?\*/', '', text)      # plain block comments
    lines = []
    for line in text.split('\n'):
        s = line.strip()
        if (s.startswith('--') or s.startswith('#') or
                re.match(r'^(LOCK TABLES|UNLOCK TABLES|USE |CREATE DATABASE|DROP DATABASE)', s, re.I)):
            continue
        lines.append(line)
    return '\n'.join(lines)


def to_sqlite_type(token):
    if INT_RE.match(token):
        return 'INTEGER'
    return 'TEXT'


def convert_create(stmt):
    m = re.search(r'CREATE TABLE `?(\w+)`?\s*\(([\s\S]*)\)\s*(ENGINE[^;]*)?$', stmt.strip(), re.I)
    if not m:
        return None
    raw_table = m.group(1)
    table = TABLE_RENAMES.get(raw_table, raw_table)
    body = m.group(2)
    parts = split_top_level_commas(body)
    cols, pk_cols = [], []
    for part in parts:
        p = part.strip()
        if not p:
            continue
        pm = re.match(r'^`?(\w+)`?\s+(.+)$', p, re.S | re.I)
        if not pm:
            continue
        col = pm.group(1)
        rest = pm.group(2).strip()
        upper = rest.upper()
        if upper.startswith('INT') and 'AUTO_INCREMENT' in upper:
            cols.append('"%s" INTEGER PRIMARY KEY AUTOINCREMENT' % col)
            continue
        if upper.startswith('PRIMARY KEY'):
            pk_cols = re.findall(r'`?(\w+)`?', rest.split('(')[1].split(')')[0])
            continue
        if upper.startswith(('KEY', 'INDEX', 'UNIQUE', 'CONSTRAINT', 'FOREIGN')):
            continue
        first_token = rest.split()[0]
        cols.append('"%s" %s' % (col, to_sqlite_type(first_token)))
    if not cols:
        return None
    ddl = 'CREATE TABLE IF NOT EXISTS "%s" (\n  %s\n)' % (table, ',\n  '.join(cols))
    if pk_cols:
        ddl += ',\n  PRIMARY KEY (%s)' % ', '.join('"%s"' % c for c in pk_cols)
    ddl += ';'
    return table, ddl, col_list_from_cols(cols)


def col_list_from_cols(cols):
    out = []
    for c in cols:
        out.append(c.split()[0].strip('"'))
    return out


def convert_insert(stmt, table_cols):
    m = re.match(r'^INSERT INTO `?(\w+)`?\s*VALUES?\s*(\([\s\S]*\))\s*$', stmt.strip(), re.I)
    if not m:
        return None
    raw_table = m.group(1)
    table = TABLE_RENAMES.get(raw_table, raw_table)
    cols = table_cols.get(table)
    if not cols:
        print('  ! no table definition for %s' % table)
        return None
    blob = m.group(2).strip()
    # Split on top-level commas WITHOUT stripping parens so each fragment
    # stays a complete (…) row; convert_insert then strips them per-row.
    rows = split_top_level_commas(blob)
    out = []
    for row in rows:
        row = row.strip()
        if not (row.startswith('(') and row.endswith(')')):
            print('  ! bad row fragment in %s: %r' % (table, row[:60]))
            continue
        vals = [v.strip() for v in split_top_level_commas(row[1:-1])]
        vals = ['NULL' if v.upper() == 'NULL' else v for v in vals]
        if len(vals) != len(cols):
            print('  ! %s: %d values vs %d columns, row skipped' % (table, len(vals), len(cols)))
            continue
        out.append('INSERT INTO "%s" (%s) VALUES (%s);' % (
            table,
            ', '.join('"%s"' % c for c in cols),
            ', '.join(vals)))
    return '\n'.join(out)


def read_sql_file(path):
    """Read the dump preserving special characters (cp1252/latin1 fallbacks)."""
    raw = open(path, 'rb').read()
    for enc in ('utf-8', 'cp1252', 'latin-1'):
        try:
            return raw.decode(enc)
        except UnicodeDecodeError:
            continue
    return raw.decode('utf-8', errors='replace')


def main():
    text = read_sql_file(SRC)
    text = strip_comments_and_noise(text)
    stmts = parse_statements(text)

    tables = {}       # name -> (ddl, cols)
    inserts = []
    for s in stmts:
        t = s.strip()
        if re.match(r'^CREATE TABLE', t, re.I):
            conv = convert_create(t)
            if conv:
                tables[conv[0]] = (conv[1], conv[2])
            else:
                print('  ! could not parse CREATE TABLE: %r' % t[:80])
        elif re.match(r'^INSERT INTO', t, re.I):
            inserts.append(t)

    # apply schema overrides AFTER parsing (application-required schemas)
    for name, (ddl, cols) in SCHEMA_OVERRIDES.items():
        tables[name] = (ddl, cols)

    table_cols = {name: cols for name, (ddl, cols) in tables.items()}
    print('Parsed %d tables, %d INSERT statements' % (len(tables), len(inserts)))

    if not os.path.isdir(OUT_DIR):
        os.makedirs(OUT_DIR)

    # schema.sql - one statement per line
    schema_lines = ['PRAGMA journal_mode=WAL;']
    for name in sorted(tables):
        ddl = tables[name][0].replace('\n', ' ')
        schema_lines.append(ddl)
    with io.open(os.path.join(OUT_DIR, 'schema.sql'), 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(schema_lines) + '\n')

    # data.sql - deletes + inserts, one statement per line
    data_lines = []
    for name in sorted(tables):
        data_lines.append('DELETE FROM "%s";' % name)
    for ins in inserts:
        conv = convert_insert(ins, table_cols)
        if conv:
            for line in conv.split('\n'):
                data_lines.append(line)
    with io.open(os.path.join(OUT_DIR, 'data.sql'), 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(data_lines) + '\n')

    print('Wrote %s' % os.path.join(OUT_DIR, 'schema.sql'))
    print('Wrote %s (%d statements)' % (os.path.join(OUT_DIR, 'data.sql'), len(data_lines)))


if __name__ == '__main__':
    sys.exit(main())
