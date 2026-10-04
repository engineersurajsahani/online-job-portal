#!/bin/sh
set -e

DB_DIR="$(dirname "$SQLITE_DB_PATH")"
mkdir -p "$DB_DIR"
echo "Starting Online Job Portal - SQLite DB: $SQLITE_DB_PATH"

exec catalina.sh run
