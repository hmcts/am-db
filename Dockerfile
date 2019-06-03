FROM postgres:10.6-alpine

COPY resources/db/migration/* /flyway/sql/