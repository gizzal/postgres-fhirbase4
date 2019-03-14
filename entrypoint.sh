#!/bin/bash
set -e

if [ "$1" = 'postgres' ]; then
    chown -R postgres "$PGDATA"

    if [ -z "$(ls -A "$PGDATA")" ]; then
        gosu postgres initdb
        gosu postgres psql -U postgres -c "CREATE DATABASE fhirbase"
        gosu postgres psql -U postgres -d fhirbase -f schema/fhirbase4.sql
        gosu postgres psql -U postgres -d fhirbase -f schema/functions.sql
        echo "hello"
    fi
    exec gosu postgres "$@"
    
fi

exec "$@"

