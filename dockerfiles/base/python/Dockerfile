FROM python:3.10.9-slim-bullseye@sha256:b22d43a1278b3d417219cc2cdc375866d23ebcfb9d852b13b974d421158f6c08 AS python_build
WORKDIR /app

#RUN addgroup --system appuser && adduser -S -s /bin/false -G appuser appuser
RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser

RUN mkdir /usr/app && chown appuser:appuser /usr/app
WORKDIR /usr/app

USER 999

ENV PATH="/usr/app/venv/bin:$PATH"
ENV dockerfile="python:3.10.9-slim-bullseye"
ENV shar256="sha256:b22d43a1278b3d417219cc2cdc375866d23ebcfb9d852b13b974d421158f6c08"
ENV created_date="12-12-2022:08.01.00"