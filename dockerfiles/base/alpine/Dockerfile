FROM alpine:3.16.3@sha256:3d426b0bfc361d6e8303f51459f17782b219dece42a1c7fe463b6014b189c86d AS alpine-base

WORKDIR /app

RUN apk add dumb-init
RUN addgroup --system appuser && adduser -S -s /bin/false -G appuser appuser

ENV dockerfile="alpine:3.16.3"
ENV shar256="sha256:3d426b0bfc361d6e8303f51459f17782b219dece42a1c7fe463b6014b189c86d"
ENV created_date="12-12-2022:08.08.00"