# DockerFiles
##### Collection of Dockerfiles for daily usage

* Docker Compose for LLM

| Framework  | Docker Compose File |
|----------------------|------------------------------------|
| Mistral + VLLM | [mistral-vllm](docker_compose_files/llm/mistral-vllm.yml) | 
| Mistral + Whisper + Coqui-TTS | [mistral-whispser-coqui-tts](docker_compose_files/llm/mistral-whisper-coqui-tts.yml) | 
| Mistral + Whisper  | [mistral-whisper](docker_compose_files/llm/mistral-whisper.yml) | 
| Ollama + OpenWeb-UI + NVIDIA GPU  | [gpu-ollama-openweb-ui](docker_compose_files/llm/gpu-ollama-openweb-ui.yml) | 
| Ollama + CPU  | [cpu-ollama](docker_compose_files/llm/cpu-ollama.yml) | 
| Ollama + NVIDIA GPU  | [gpu-ollama](docker_compose_files/llm/gpu-ollama.yml) | 
| VLLM + HuggingFace + NVIDIA GPU  | [gpu-ollama](docker_compose_files/llm/gpu-vllm.yml) | 



* List of Available Docker Images

| Docker Image         | Docker Hub Repo                                                                                     | Github Package Registry                                                                                       | Size(Mb) |
|----------------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|----------|
| [Whisper](dockerfiles/llm/Whisper-Dockerfile)  | [slabstech/whisper-cpu-api](https://hub.docker.com/r/slabstech/revive-server-spring-boot) | [whisper-cpu-api](https://github.com/sachinsshetty/revive/pkgs/container/revive-server-spring-boot) | -    |
| Server - SpringBoot  | [slabstech/revive-server-spring-boot](https://hub.docker.com/r/slabstech/revive-server-spring-boot) | [revive-server-spring-boot](https://github.com/sachinsshetty/revive/pkgs/container/revive-server-spring-boot) | 157.3    |
| Server - Dropwizard  | [slabstech/revive-server-dropwizard](https://hub.docker.com/r/slabstech/revive-server-dropwizard)   | [revive-server-dropwizard](https://github.com/sachinsshetty/revive/pkgs/container/revive-server-dropwizard)   | 109.2    |
| Client - ReactJS     | [slabstech/revive-client-reactjs](https://hub.docker.com/r/slabstech/revive-client-reactjs)         | [revive-client-reactjs](https://github.com/sachinsshetty/revive/pkgs/container/revive-client-reactjs)         | 54.13    |
| DB - PostgreSQL      | [slabstech/revive-db-postgresql](https://hub.docker.com/r/slabstech/revive-db-postgresql)           | [revive-db-postgresql](https://github.com/sachinsshetty/revive/pkgs/container/revive-db-postgresql)           | 80.07    |
| SpringBoot - Postgis | [slabstech/revive-db-postgresql](https://hub.docker.com/r/slabstech/revive-db-postgresql)           | [revive-db-postgresql](https://github.com/sachinsshetty/revive/pkgs/container/revive-db-postgresql)           | 80.07    |


* Commands used to build different Docker Images

| Description                               | Command                                                                                                      |
|-------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Docker command to build an image          | docker build -t username/imagename:version .                                                                 |
| Start a docker instance from docker_image | docker run --name docker_image -d database                                                                   |
| Connect to postgres instance              | docker exec -it docker_instance psql -U postgres_user                                                        |
| Docker Image for Postgres DB              | docker build --rm . -t reponame/db-postgresql -f dockerfiles/db/postgresql/Dockerfile                        |
| Docker Image for SpringBoot               | docker build --rm . -t reponame/server-spring-boot network host -f dockerfiles/server/spring_boot/Dockerfile |
| Docker Image for Dropwizard               | docker build --rm . -t reponame/db-postgresql -f dockerfiles/db/postgresql/Dockerfile                        |
| Docker Image for ReactJS                  | docker build --rm . -t reponame/client-reactjs --network host -f dockerfiles/client/reactjs/Dockerfile       |


* Verify in browser with containerImageIp:8080



### Docker Administration Commands

| Description                    | Command                                     | Example                                                   |
|--------------------------------|---------------------------------------------|-----------------------------------------------------------|
| List all containers (only IDs) | docker ps -aq                               | -                                                         |
| Remove all containers          | docker rm $(docker ps -aq)                  | -                                                         |
| Stop all running containers    | docker stop $(docker ps -aq)                | -                                                         |
| Remove all images              | docker rmi $(docker images -q)              | -                                                         |
| Docker Cleanup                 | docker system prune                         | -                                                         |
| Full cleanup                   | docker system prune -a                      | -                                                         |
| tagging docker images          | docker tag imageid tagname/version          | docker tag 85071cb77bb6 alpline-jre/latest                |
| save docker imageid            | docker save reponame/version > filename.tar | docker save alpline-jre/latest > alpline-jre.tar          |
| build docker imageid           | docker build -t repo/version -f folder .    | docker build -t debian-stretch-slim-v1  -f dockerFolder . |
| docker push                    | docker push imageDetails                    | docket push slabstech:debian-stretch-slim-v1              |




#### Additional Usage Examples

1. Using jfrog artifactory for maven .

  a. Fetch the artifactory repo from jfrog

   sudo docker pull docker.bintray.io/jfrog/artifactory-oss:latest

  b. Run the artifactory

   sudo docker run --name artifactory -d -p 8082:8081 docker.bintray.io/jfrog/artifactory-oss:latest 



#### References

* https://maven.apache.org/plugins/maven-dependency-plugin/examples/resolving-conflicts-using-the-dependency-tree.html
* https://wiki.alpinelinux.org/wiki/Comparison_with_other_distros
* https://github.com/docker-library/postgres/blob/4e56664f1797ba4cc0f5917b6d794792a5571b45/14/alpine/Dockerfile
* https://github.com/docker-library/docs/blob/master/postgres/README.md
* https://hub.docker.com/_/postgres
* https://snapshooter.com/learn/postgresql/deploy-postgres-with-docker
* https://hub.docker.com/r/cafapi/java-postgres
* https://www.baeldung.com/spring-boot-postgresql-docker
* https://hub.docker.com/_/openjdk
* https://snyk.io/blog/best-practices-for-managing-java-dependencies/

### FAQ's

1. How do i execute as Root, when i get permission error for executing command .
   a. Added USER root before the command in docker file

