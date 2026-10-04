#!/usr/bin/env python3
"""One-shot migration to SQLite for the Online Job Portal.

- Replaces MySQL DriverManager blocks in JSPs/servlets with util.DB.get()
- Converts MySQL-only && / || SQL operators to AND / OR
- Fixes Windows-style report paths (report\\x.jasper -> report/x.jasper)
- Fixes MySQL driver imports in View_report.jsp
Run once from the project root:  python tools/migrate_sqlite.py
"""
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

JDBC_BLOCK = re.compile(
    r'[ \t]*Class\.forName\("com\.mysql\.jdbc\.Driver"\);\r?\n'
    r'[ \t]*cn\s*=\s*DriverManager\.getConnection\(\s*"jdbc:mysql://localhost:3306/online_job_portal"\s*,\s*"root"\s*,\s*"root"\s*\);'
)

def conv_file(path):
    with io.open(path, 'r', encoding='utf-8', errors='replace') as f:
        src = f.read()
    orig = src

    # 1) Replace the 2-line MySQL connect block with util.DB
    src = JDBC_BLOCK.sub('cn = util.DB.get();', src)

    # 2) SQL operators inside Java/JSP string literals
    src = src.replace("' && password='", "' AND password='")
    src = src.replace("' && status='", "' AND status='")
    src = src.replace("\"' || jobtitle='\"", "\"' OR jobtitle='\"")
    src = src.replace("' || jobtitle='", "' OR jobtitle='")

    # 3) Windows report paths
    src = src.replace('report\\\\Userlist.jasper', 'report/Userlist.jasper')
    src = src.replace('report\\\\recruter_list.jasper', 'report/recruter_list.jasper')
    src = src.replace('report\\\\job_list.jasper', 'report/job_list.jasper')
    src = src.replace('report\\\\category_list.jasper', 'report/category_list.jasper')
    src = src.replace('report\\\\applay_list.jasper', 'report/applay_list.jasper')
    src = src.replace('report\\\\feedback_list.jasper', 'report/feedback_list.jasper')
    src = src.replace('report\\\\contact_list.jasper', 'report/contact_list.jasper')
    src = src.replace('report\\\\id_wise_user_list.jasper', 'report/id_wise_user_list.jasper')
    src = src.replace('report\\\\id_wise_recruter_list.jasper', 'report/id_wise_recruter_list.jasper')
    src = src.replace('report\\\\id_wise_job_list.jasper', 'report/id_wise_job_list.jasper')
    src = src.replace('report\\\\id_wise_apply_list.jasper', 'report/id_wise_apply_list.jasper')
    src = src.replace('report\\\\date_wise_applay_list.jasper', 'report/date_wise_applay_list.jasper')
    src = src.replace('report\\\\date_wise_feedback_list.jasper', 'report/date_wise_feedback_list.jasper')

    # 4) MySQL driver import in View_report.jsp
    src = src.replace('import="com.mysql.jdbc.Driver"', 'import="java.sql.Driver"')

    if src != orig:
        with io.open(path, 'w', encoding='utf-8', newline='') as f:
            f.write(src)
        return True
    return False

def main():
    changed = []
    targets = []
    for base, dirs, files in os.walk(os.path.join(ROOT, 'src', 'main')):
        dirs[:] = [d for d in dirs if d not in ('build', 'report', 'images', 'css', 'js', 'database')]
        for name in files:
            if name.endswith(('.java', '.jsp')):
                targets.append(os.path.join(base, name))
    for path in targets:
        if conv_file(path):
            changed.append(os.path.relpath(path, ROOT))
    print('Modified %d files:' % len(changed))
    for c in sorted(changed):
        print('  ' + c)

if __name__ == '__main__':
    sys.exit(main())
