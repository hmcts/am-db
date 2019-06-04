#!/usr/bin/env bash

set -e

if [ -z "$AM_DB_USERNAME" ] || [ -z "$AM_DB_PASSWORD" ]; then
  echo "ERROR: Missing environment variable. Set value for both 'AM_DB_USERNAME' and 'AM_DB_PASSWORD'."
  exit 1
fi

# Create roles and databases
psql -v ON_ERROR_STOP=1 --username postgres --set USERNAME=$AM_DB_USERNAME --set PASSWORD=$AM_DB_PASSWORD <<-EOSQL
  CREATE USER :USERNAME WITH PASSWORD ':PASSWORD';
EOSQL

psql -v ON_ERROR_STOP=1 --username postgres --set USERNAME=$AM_DB_USERNAME --set PASSWORD=$AM_DB_PASSWORD --set DATABASE=$AM_DB <<-EOSQL
  CREATE DATABASE :DATABASE
    WITH OWNER = :USERNAME
    ENCODING = 'UTF-8'
    CONNECTION LIMIT = -1;
    ALTER SCHEMA public OWNER TO :USERNAME;
EOSQL
  echo "Database $service: Created"

