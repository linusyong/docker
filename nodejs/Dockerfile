# nodejs: Dockerfile for building nodejs
# Based on phusion/baseimage
#
# Version NodeJS 0.10.33
#
# Author "Linus Yong <linus@alphatise.com>
#
FROM phusion/baseimage:0.9.15

MAINTAINER Linus Yong "linus@alphatise.com"

# Security and workaround
RUN echo "root:password" | chpasswd
RUN /usr/bin/workaround-docker-2267
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install required packages and nodejs
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y build-essential curl && \
    curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get install -y nodejs

RUN npm install -g n && \
    n 0.10.33 && \
    n use 0.10.33

RUN npm install -g twelve

# Define default command
CMD [ "/sbin/my_init" ]
