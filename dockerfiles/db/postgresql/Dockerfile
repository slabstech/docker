FROM postgres:alpine3.15

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB postgres

COPY docker/db/postgresql/postgresql_schema.sql /docker-entrypoint-initdb.d/
