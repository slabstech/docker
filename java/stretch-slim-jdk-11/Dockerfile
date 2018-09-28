FROM openjdk:11-ea-28-jdk-slim

MAINTAINER Sachin Shetty <websachinshetty@gmail.com>

#exposing ports
EXPOSE 80
EXPOSE 22


#basic container setup
RUN echo deb http://ftp.debian.org/debian/ stretch main non-free contrib >> /etc/apt/sources.list
RUN echo deb-src http://ftp.debian.org/debian/ stretch main non-free contrib >> /etc/apt/sources.list
RUN echo deb http://security.debian.org/debian-security stretch/updates main contrib non-free >> /etc/apt/sources.list
RUN echo deb-src http://security.debian.org/debian-security stretch/updates main contrib non-free >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y gnupg wget
#postgres 9.6 install 

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && apt-get install -y gnupg postgresql-9.6 postgresql-client-9.6 postgresql-contrib-9.6

USER postgres

RUN    /etc/init.d/postgresql start &&\ 
	psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.6/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/9.6/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.6/bin/postgres", "-D", "/var/lib/postgresql/9.6/main", "-c", "config_file=/etc/postgresql/9.6/main/postgresql.conf"]

## 