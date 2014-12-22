#!/bin/sh
docker run \
  --name nginx \
  --net=host \
  -v /home/core/docker/nginx-php-fpm/exports/html:/var/www/html \
  -v /home/core/docker/nginx-php-fpm/nginx/exports/etc:/etc/nginx \
  -v /home/core/docker/nginx-php-fpm/nginx/exports/log:/var/log/nginx \
  -p 80:80 -d nginx
