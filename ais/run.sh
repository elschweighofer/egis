#!/bin/bash

export PGDATA=/opt/homebrew/var/postgresql@14/
postgres >ais.logfile 2>&1 &
psql -U postgres -p 5432 -e -c "DROP DATABASE IF EXISTS vessels WITH (FORCE)"
createdb vessels
