FROM postgres:13.9-alpine3.17@sha256:f98187f7db9420506702ff3be2738f74b7988e5d3f81a7a3f67d4ebec4ef31e3

RUN addgroup --system appuser && adduser -S -s /bin/false -G appuser appuser

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB postgres

COPY docker/db/postgresql/postgresql_schema.sql /docker-entrypoint-initdb.d/

ENV dockerfile="postgres:13.9-alpine3.17"
ENV shar256="sha256:f98187f7db9420506702ff3be2738f74b7988e5d3f81a7a3f67d4ebec4ef31e3"
ENV created_date="17-12-2022:10.39.00"