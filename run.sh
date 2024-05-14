#!/bin/bash

export PGDATA=/opt/homebrew/var/postgresql@14/
postgres >logfile 2>&1 &
psql -U postgres -p 5432 -e -c "DROP DATABASE IF EXISTS spatialdb WITH (FORCE)"
psql -U postgres -p 5432 -e -c "DROP DATABASE IF EXISTS vessels WITH (FORCE)"
createdb spatialdb
createdb vessels
psql -U postgres -p 5432 -e -d spatialdb -f spatialDB.sql
