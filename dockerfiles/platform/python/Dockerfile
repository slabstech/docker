FROM debian:bullseye-slim@sha256:d87ecab052fd05f744e6c68ec7fa3c464b205da4ab23bd35c350499a9d2d1dc2 AS python_build
WORKDIR /app

#RUN addgroup --system appuser && adduser -S -s /bin/false -G appuser appuser

ENV dockerfile="debian:bullseye-slim"
ENV shar256="sha256:d87ecab052fd05f744e6c68ec7fa3c464b205da4ab23bd35c350499a9d2d1dc2"
ENV created_date="18-12-2022:14.01.00"

RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser

RUN mkdir /usr/app && chown appuser:appuser /usr/app
WORKDIR /usr/app