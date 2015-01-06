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
# --link php-fpm:php-fpm : link to php-fpm container
# --volumes-from php-fpm : this gets all the volumes exported from php-fpm
# --volume /home/core/docker/nginx-php-fpm/nginx/exports/etc:/etc/nginx : export volume for nginx configuration files
# --volume /home/core/docker/nginx-php-fpm/nginx/exports/log:/var/log/nginx : export volume for nginx logs
# --detach nginx:1.6.2 : run detached and using nginx:latest docker image
#

echo -n "Running container: "
docker run \
  --name nginx \
  --link php-fpm:php-fpm \
  --volumes-from php-fpm \
  --volume /home/core/docker/nginx-php-fpm/nginx/exports/etc:/etc/nginx \
  --volume /home/core/docker/nginx-php-fpm/nginx/exports/log:/var/log/nginx \
  --detach nginx:1.6.2
