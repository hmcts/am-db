FROM postgres:10.6-alpine
FROM gradle:4.10-jdk8 as builder
LABEL maintainer="https://github.com/hmcts/am-db"

COPY . /home/gradle/src
USER root
RUN chown -R gradle:gradle /home/gradle/src
USER gradle

WORKDIR /home/gradle/src

COPY ./docker/am-db/docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d/

HEALTHCHECK --interval=10s --timeout=10s --retries=10 CMD psql -c 'select 1' -d ${AM_DB} -U ${AM_DB_USERNAME}

EXPOSE 5432
