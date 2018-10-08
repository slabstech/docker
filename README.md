# DockerFiles
##### Collection of Dockerfiles for daily usage




### Docker Commands

| Description | Command | Example |
|-------|-------------|-------|
| List all containers (only IDs) | ```docker ps -aq``` | - |
| Remove all containers| ```docker rm $(docker ps -aq)``` | - |
| Stop all running containers | ```docker stop $(docker ps -aq) ``` | - |
| Remove all images | ```docker rmi $(docker images -q)``` | - |
| Docker Cleanup | ```docker system prune``` | - |
| Full cleanup | ```docker system prune -a``` | - |
| tagging docker images | ```docker tag imageid tagname/version``` |  docker tag 85071cb77bb6 alpline-jre/latest |
| save docker imageid | ```docker save reponame/version > filename.tar``` | docker save alpline-jre/latest > alpline-jre.tar |
| build docker imageid |  ```docker build -t repo/version -f folder . ``` | docker build -t debian-stretch-slim-v1  -f dockerFolder .  |
|docker push  | ```docker push imageDetails``` | docket push slabstech:debian-stretch-slim-v1 |



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
