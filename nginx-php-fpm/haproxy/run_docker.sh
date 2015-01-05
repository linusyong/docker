#!/bin/sh

## if haproxy is dead or running, remove it
container_id=$(docker ps -a | grep haproxy | cut -f1 -d\ )
if [ "$container_id" ]
then
  echo -n "Removing container: "
  docker rm -f $container_id
fi

## now run haproxy docker container
#
# --name nginx : name the docker container nginx
# --link php-fpm:php-fpm : link to php-fpm container
# --volume /home/core/docker/nginx-php-fpm/exports/html:/var/www/html : export volume for php / html files
# --volume /home/core/docker/nginx-php-fpm/nginx/exports/etc:/etc/nginx : export volume for nginx configuration files
# --volume /home/core/docker/nginx-php-fpm/nginx/exports/log:/var/log/nginx : export volume for nginx logs
# --publish 80:80 : publish port 80 of container to port 80 of host
# --detach nginx:1.6.2 : run detached and using nginx:latest docker image
#

echo -n "Running container: "
docker run \
  --name haproxy \
  --link nginx:nginx\
  --volume /home/core/docker/nginx-php-fpm/haproxy/exports/etc:/etc/haproxy \
  --publish 80:80 \
  --publish 443:443 \
  --detach haproxy:1.5.9
