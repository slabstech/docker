* Dockerfile for postges
    * Create docker image from Dockerfile_db
      * docker build -t docker_image .
      * Ex, docker build -t avti_image .
    * Start a docker instance from docker_image
      * docker run --name docker_image -d postgres
      * Ex : docker run --name avti_run -d avti_run
    * Connect to postgres instance
      * docker exec -it docker_instance psql -U postgres_user
      Ex. docker exec -it avti_run psql -U avti_user

* Docker file for java
    * Copy created jar file to target directory
    * Dockerfile_java will copy the jar file and execute the command "java -jar name.jar"


* Docker Compose
    * docker-compose up




* References
Official postgres with alpine
* https://github.com/docker-library/postgres/blob/4e56664f1797ba4cc0f5917b6d794792a5571b45/14/alpine/Dockerfile
* https://github.com/docker-library/docs/blob/master/postgres/README.md
* https://hub.docker.com/_/postgres
* https://snapshooter.com/learn/postgresql/deploy-postgres-with-docker
* https://hub.docker.com/r/cafapi/java-postgres
* https://www.baeldung.com/spring-boot-postgresql-docker
* https://hub.docker.com/_/openjdk
