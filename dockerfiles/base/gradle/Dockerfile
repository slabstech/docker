FROM gradle:7.6-jdk17-alpine@sha256:5dfba081fd2e6e50b3d3491239428a9bf438f51f4b59e868e8ae3f5c3b6e0ec8 AS alpine_gradle
WORKDIR /app

RUN addgroup --system appuser && adduser -S -s /bin/false -G appuser appuser
ENV dockerfile="gradle:7.6-jdk17-alpine"
ENV shar256="sha256:5dfba081fd2e6e50b3d3491239428a9bf438f51f4b59e868e8ae3f5c3b6e0ec8"
ENV created_date="12-12-2022:08.49.00"