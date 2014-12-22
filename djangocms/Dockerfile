# DjangoCMS: Dockerfile for DjangoCMS image
# Based on phusion/baseimage
#
# Version 
#
# Author "Linus Yong" <linusyong@gmail.com>
#
FROM phusion/baseimage:0.9.15

MAINTAINER Linus Yong "linus@alphatise.com"

# Security and workaround
RUN echo "root:password" | chpasswd
RUN /usr/bin/workaround-docker-2267
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
ENV DEBIAN_FRONTEND noninteractive

# Install Python VirtualEnv
RUN apt-get update && apt-get -y dist-upgrade
RUN mkdir -p /opt/djangocms/alphatise_corporate_cms
RUN apt-get -y install git python-virtualenv libpq-dev libxml2-dev libxslt1-dev python-dev
RUN virtualenv /opt/djangocms/alphatise_corporate_cms
COPY requirements.txt /opt/djangocms/alphatise_corporate_cms/
RUN /opt/djangocms/alphatise_corporate_cms/bin/pip install -r /opt/djangocms/alphatise_corporate_cms/requirements.txt

# Expose ports
EXPOSE 8000

# Define mountable directories
#VOLUME [ ]

# Define working directory
WORKDIR /opt/djangocms/alphatise_corporate_cms

# Define default command
CMD [ "/sbin/my_init" ]
