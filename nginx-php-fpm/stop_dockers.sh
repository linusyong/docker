#!/bin/sh
## if nginx is dead or running, remove it
container_id=$(docker ps -a | grep nginx | cut -f1 -d\ )
if [ "$container_id" ]
then
  echo -en "Removing Nginx container: "
  docker rm -f $container_id
fi

## if php-fpm is dead or running, remove it
container_id=$(docker ps -a | grep php-fpm | cut -f1 -d\ )
if [ "$container_id" ]
then
  echo -en "\nRemoving PHP-FPM container: "
  docker rm -f $container_id
fi

## if haproxy is dead or running, remove it
container_id=$(docker ps -a | grep haproxy | cut -f1 -d\ )
if [ "$container_id" ]
then
  echo -en "\nRemoving HAProxy container: "
  docker rm -f $container_id
fi
echo -en "\n"
