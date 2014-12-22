# Nginx: Dockerfile for PHP-FPM image
# Based on phusion/baseimage
#
# Version 5.4 build 0
#
# Author "Linus Yong" <linusyong@gmail.com>
#
FROM phusion/baseimage:0.9.15

MAINTAINER Linus Yong "linus@alphatise.com"

# Security and workaround
RUN echo "root:password" | chpasswd
RUN /usr/bin/workaround-docker-2267
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install PHP and PHP-FPM
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install php5-fpm

# Packages install done, clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Define PHP-FPM servie
RUN mkdir /etc/service/php-fpm
COPY php-fpm.service /etc/service/php-fpm/run

# Expose ports
EXPOSE 9000

# Define mountable directories
VOLUME [ "/usr/share/nginx/html", "/etc/php5" ]

# Define working directory
#WORKDIR /etc/nginx

# Define default command
CMD [ "/sbin/my_init" ]
