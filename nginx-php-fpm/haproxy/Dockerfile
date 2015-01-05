# HAProxy: Dockerfile for HAProxy image
# Based on phusion/baseimage
#
# Version HAProxy
#
# Author "Linus Yong" <linusyong@gmail.com>
#
FROM phusion/baseimage:0.9.15

MAINTAINER Linus Yong "linus@alphatise.com"

# Security and workaround
RUN echo "root:password" | chpasswd
RUN /usr/bin/workaround-docker-2267
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install haproxy
ENV DEBIAN_FRONTEND noninteractive
RUN apt-add-repository ppa:vbernat/haproxy-1.5
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install haproxy

# Packages install done, clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Define Nginx servie
RUN mkdir /etc/service/haproxy
COPY haproxy.service /etc/service/haproxy/run

# Expose ports
EXPOSE 80
EXPOSE 443

# Define mountable directories
VOLUME [ "/etc/haproxy" ]

# Define working directory
WORKDIR /etc/haproxy

# Define default command
CMD [ "/sbin/my_init" ]
