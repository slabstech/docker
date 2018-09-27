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
RUN apt-get update && apt-get install -y emacs wget dialog ipcalc ntp ntpdate smbclient less flip unzip zip bzip2 dnsutils nmap openssh-server ethtool net-tools memtester lshw screen tcpdump rsync mailutils lynx iptraf htop iotop locate debsecan ntfs-3g hdparm nano apache2 postgresql libclass-accessor-perl libintl-perl libio-socket-ip-perl libio-string-perl  libnet-libidn-perl libparse-debianchangelog-perl libsub-name-perl libswitch-perl libtext-unidecode-perl libuuid-perl aptitude aptitude-common aptitude-doc-en bash-completion bsd-mailx busybox console-setup console-setup-linux dc debian-faq dictionaries-common dmsetup dnsutils discover discover-data dmidecode doc-debian ftp iamerican ibritish ienglish-common install-info installation-report iputils-ping ispell kbd keyboard-configuration klibc-utils libasn1-8-heimdal:amd64 libdaemon0:amd64 libcwidget3v5:amd64 libdiscover2 libdumbnet1 libgnutls-openssl27:amd64 libgssapi3-heimdal:amd64 libhcrypto4-heimdal:amd64 libheimbase1-heimdal:amd64 libheimntlm0-heimdal:amd64 libklibc libkrb5-26-heimdal:amd64 libmnl0:amd64 libnet-ssleay-perl libroken18-heimdal:amd64 libsigc++-2.0-0v5:amd64 libwind0-heimdal:amd64 m4 telnet texinfo traceroute tzdata util-linux-locales vim-common vim-tiny w3m wamerican whiptail zerofree acpi apt-listchanges at eject info libnetfilter-acct1:amd64 libnss-mdns:amd64 netcat-traditional nfacct task-english task-ssh-server tasksel tasksel-data time cups



#fixing locale/env variables for postgresql
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y locales 
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8



#postgres 9.6 install 

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && apt-get install -y postgresql-9.6 postgresql-client-9.6 postgresql-contrib-9.6


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