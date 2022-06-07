# DockerFiles
##### Collection of Dockerfiles for daily usage



| Description                               | Command                                                                                          |
|-------------------------------------------|--------------------------------------------------------------------------------------------------|
| Docker command to build an image          | docker build -t username/imagename:version                                                       |
| Start a docker instance from docker_image | docker run --name docker_image -d database                                                       |
| Connect to postgres instance              | docker exec -it docker_instance psql -U postgres_user                                            |
| Docker Image for Postgres DB              | docker build rm . -t reponame/db-postgresql -f dockerfiles/db/postgresql/Dockerfile       |
| Docker Image for SpringBoot               | docker build rm . -t reponame/server-spring-boot network host -f dockerfiles/server/spring_boot/Dockerfile |
| Docker Image for Dropwizard               | docker build rm . -t reponame/db-postgresql -f dockerfiles/db/postgresql/Dockerfile          |
| Dockerfile for ReactJS                    | docker build rm . -t reponame/client-reactjs --network host -f dockerfiles/client/reactjs/Dockerfile |


* Verify in browser with containerImageIp:8080


* Extra
* To test postgres db container
  * Start a docker instance from docker_image
    * docker run --name docker_image -d postgres
    * Ex : docker run --name revive-db -d revive_run
  *
    * 
    * Ex. docker exec -it revive_run psql -U revive_db


### Docker Administration Commands

| Description                    | Command                                           | Example                                                   |
|--------------------------------|---------------------------------------------------|-----------------------------------------------------------|
| List all containers (only IDs) | ```docker ps -aq```                               | -                                                         |
| Remove all containers          | ```docker rm $(docker ps -aq)```                  | -                                                         |
| Stop all running containers    | ```docker stop $(docker ps -aq) ```               | -                                                         |
| Remove all images              | ```docker rmi $(docker images -q)```              | -                                                         |
| Docker Cleanup                 | ```docker system prune```                         | -                                                         |
| Full cleanup                   | ```docker system prune -a```                      | -                                                         |
| tagging docker images          | ```docker tag imageid tagname/version```          | docker tag 85071cb77bb6 alpline-jre/latest                |
| save docker imageid            | ```docker save reponame/version > filename.tar``` | docker save alpline-jre/latest > alpline-jre.tar          |
| build docker imageid           | ```docker build -t repo/version -f folder . ```   | docker build -t debian-stretch-slim-v1  -f dockerFolder . |
| docker push                    | ```docker push imageDetails```                    | docket push slabstech:debian-stretch-slim-v1              |



### FAQ's

1. How do i execute as Root, when i get permission error for executing command .
  a. Added ```USER root``` before the command in docker file
2.



#### Additional Usage Examples

1. Using jfrog artifactory for maven .

  a. Fetch the artifactory repo from jfrog

   ```sudo docker pull docker.bintray.io/jfrog/artifactory-oss:latest```

  b. Run the artifactory

  ``` sudo docker run --name artifactory -d -p 8082:8081 docker.bintray.io/jfrog/artifactory-oss:latest ```



#### Alpine linux commands

1. https://maven.apache.org/plugins/maven-dependency-plugin/examples/resolving-conflicts-using-the-dependency-tree.html
2. https://wiki.alpinelinux.org/wiki/Comparison_with_other_distros


----------

*

* References
  Official postgres with alpine
* https://github.com/docker-library/postgres/blob/4e56664f1797ba4cc0f5917b6d794792a5571b45/14/alpine/Dockerfile
* https://github.com/docker-library/docs/blob/master/postgres/README.md
* https://hub.docker.com/_/postgres
* https://snapshooter.com/learn/postgresql/deploy-postgres-with-docker
* https://hub.docker.com/r/cafapi/java-postgres
* https://www.baeldung.com/spring-boot-postgresql-docker
* https://hub.docker.com/_/openjdk
