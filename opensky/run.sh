#!/bin/bash

export PGDATA=/opt/homebrew/var/postgresql@14/
postgres >opensky.logfile 2>&1 &
psql -U postgres -p 5432 -e -c "DROP DATABASE IF EXISTS opensky WITH (FORCE)"
createdb opensky
