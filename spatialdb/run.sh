#!/bin/bash

export PGDATA=/opt/homebrew/var/postgresql@14/
postgres >spatial.logfile 2>&1 &
psql -U postgres -p 5432 -e -c "DROP DATABASE IF EXISTS spatialdb WITH (FORCE)"
createdb spatialdb
psql -U postgres -p 5432 -e -d spatialdb -f spatialDB.sql
