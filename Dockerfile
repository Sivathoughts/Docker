# use base image.
FROM ubuntu:18.04

# install system packages.
#RUN apt install wget
ENV DEBIAN_FRONTEND noninteractive

RUN set -x \
&& apt update \
&& apt install -y mysql-common debsums


# Download and install percona system packages.
#RUN set -x \
#&& wget https://www.percona.com/downloads/Percona-Server-5.7/Percona-Server-5.7.29-32/binary/debian/bionic/x86_64/percona-server-server-5.7_5.7.29-32-1.bionic_amd64.deb \
#&& wget https://www.percona.com/downloads/Percona-Server-5.7/Percona-Server-5.7.29-32/binary/debian/bionic/x86_64/percona-server-client-5.7_5.7.29-32-1.bionic_amd64.deb \
#&& wget https://www.percona.com/downloads/Percona-Server-5.7/Percona-Server-5.7.29-32/binary/debian/bionic/x86_64/percona-server-common-5.7_5.7.29-32-1.bionic_amd64.deb

COPY percona-server-common-5.7_5.7.29-32-1.bionic_amd64.deb /tmp
COPY percona-server-client-5.7_5.7.29-32-1.bionic_amd64.deb /tmp
COPY percona-server-server-5.7_5.7.29-32-1.bionic_amd64.deb /tmp

WORKDIR /tmp

RUN set -x \
&& apt install -y ./percona-server-common-5.7_5.7.29-32-1.bionic_amd64.deb \
&& apt install -y ./percona-server-client-5.7_5.7.29-32-1.bionic_amd64.deb \
&& apt install -y ./percona-server-server-5.7_5.7.29-32-1.bionic_amd64.deb 






