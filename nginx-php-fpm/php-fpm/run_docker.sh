#!/bin/sh

## if php-fpm is dead or running, remove it
container_id=$(docker ps -a | grep php-fpm | cut -f1 -d\ )
if [ "$container_id" ]
then
  echo -n "Removing container: "
  docker rm -f $container_id
fi

## now run php-fpm docker container
#
# --name php-fpm : name the docker container php-fpm
# --net=host : using host network so that nginx and php-fpm can communcation thru 127.0.0.1:9000
# --volume /home/core/docker/nginx-php-fpm/exports/html:/var/www/html : export volume for php / html files
# --volume /home/core/docker/nginx-php-fpm/php-fpm/exports/etc:/etc/php5 : export volume php-fpm configuration files
# --publish 9000:9000 : publish port 80 of container to port 9000 of host
# --detach php-fpm:latest : run detached and using php-fpm:latest docker image
#

echo -n "Running container: "
docker run \
  --name php-fpm \
  --net=host \
  --volume /home/core/docker/nginx-php-fpm/exports/html:/var/www/html \
  --volume /home/core/docker/nginx-php-fpm/php-fpm/exports/etc:/etc/php5 \
  --publish 9000:9000 -d php-fpm:latest
