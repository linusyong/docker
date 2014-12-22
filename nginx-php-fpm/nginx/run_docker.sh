#!/bin/sh

## if nginx is dead or running, remove it
container_id=$(docker ps -a | grep nginx | cut -f1 -d\ )
if [ "$container_id" ]
then
  echo -n "Removing container: "
  docker rm -f $container_id
fi

## now run nginx docker container
#
# --name nginx : name the docker container nginx
# --net=host : using host network so that nginx and php-fpm can communcation thru 127.0.0.1:9000
# --volume /home/core/docker/nginx-php-fpm/exports/html:/var/www/html : export volume for php / html files
# --volume /home/core/docker/nginx-php-fpm/nginx/exports/etc:/etc/nginx : export volume for nginx configuration files
# --volume /home/core/docker/nginx-php-fpm/nginx/exports/log:/var/log/nginx : export volume for nginx logs
# --publish 80:80 : publish port 80 of container to port 80 of host
# --detach nginx:latest : run detached and using nginx:latest docker image
#

echo -n "Running container: "
docker run \
  --name nginx \
  --net=host \
  --volume /home/core/docker/nginx-php-fpm/exports/html:/var/www/html \
  --volume /home/core/docker/nginx-php-fpm/nginx/exports/etc:/etc/nginx \
  --volume /home/core/docker/nginx-php-fpm/nginx/exports/log:/var/log/nginx \
  --publish 80:80 \
  --detach nginx:latest
