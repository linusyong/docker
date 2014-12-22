#!/bin/sh
docker run \
  --name php-fpm \
  -v /home/core/docker/nginx-php-fpm/exports/html:/var/www/html \
  -v /home/core/docker/nginx-php-fpm/php-fpm/exports/etc:/etc/php5 \
  -p 9000:9000 -d php-fpm
