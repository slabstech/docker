Official postgres with alpine
* https://github.com/docker-library/postgres/blob/4e56664f1797ba4cc0f5917b6d794792a5571b45/14/alpine/Dockerfile
* https://github.com/docker-library/docs/blob/master/postgres/README.md
* https://hub.docker.com/_/postgres
* https://snapshooter.com/learn/postgresql/deploy-postgres-with-docker


* Dockerfile
    * docker build -t docker_build .
    * Ex, docker build -t avti .

    * docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres
    * Ex : docker run --name avti_run -e POSTGRES_PASSWORD=postgres -d avti



* Docker Compose
    * docker-compose up -d
