FROM postgres:10.6-alpine

COPY ./docker/am-db/docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d/

HEALTHCHECK --interval=10s --timeout=10s --retries=10 CMD psql -c 'select 1' -d ${AM_DB} -U ${AM_DB_USERNAME}

EXPOSE 5432
