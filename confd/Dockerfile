# nodejs: Dockerfile for building nodejs
# Based on phusion/baseimage
#
# Version ConfD 0.7.1
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
COPY confd-0.7.1-linux-amd64 /usr/bin/confd
COPY etcdctl-v2.0.0-rc.1-linux-amd64 /usr/bin/etcdctl

# Define default command
CMD [ "/sbin/my_init" ]
