# Nginx: Dockerfile for Nginx image
# Based on phusion/baseimage
#
# Version Nginx 1.6.2
#
# Author "Linus Yong" <linusyong@gmail.com>
#
FROM phusion/baseimage:0.9.15

MAINTAINER Linus Yong "linus@alphatise.com"

# Security and workaround
RUN echo "root:password" | chpasswd
RUN /usr/bin/workaround-docker-2267
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Add Nginx repository and install nginx-extras
ENV DEBIAN_FRONTEND noninteractive
RUN add-apt-repository ppa:nginx/stable
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install nginx-extras

# Packages install done, clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Define Nginx servie
RUN mkdir /etc/service/nginx
COPY nginx.service /etc/service/nginx/run

# Expose ports
EXPOSE 80
EXPOSE 443

# Define mountable directories
VOLUME [ "/etc/nginx", "/var/log/nginx" ]

# Define working directory
WORKDIR /etc/nginx

# Define default command
CMD [ "/sbin/my_init" ]
