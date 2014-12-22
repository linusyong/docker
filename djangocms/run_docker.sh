#!/bin/sh
docker run \
  --name cms \
  -v /home/core/docker/djangocms/exports/etc:/etc/nginx \
  -v /home/core/docker/djangocms/exports/log:/var/log/nginx \
  -p 80:80 -d djangocms
