FROM node:18.12.1-alpine3.16@sha256:67373bd5d90ea600cb5f0fa58d7a5a4e6ebf50b6e05c50c1d1cc22df5134db43 AS node_build
WORKDIR /app

RUN addgroup --system appuser && adduser -S -s /bin/false -G appuser appuser
ENV dockerfile="node:18.12.1-alpine3.16"
ENV shar256="sha256:67373bd5d90ea600cb5f0fa58d7a5a4e6ebf50b6e05c50c1d1cc22df5134db43"
ENV created_date="12-12-2022:07.57.00"