#!/bin/bash

rm -rf nginx/exports/log/*
./stop_dockers.sh

docker_image=$(docker images -q nginx)
if [ "$docker_image" ]
then
  docker rmi $docker_image
  docker build --rm -t nginx:1.6.2 nginx
fi

docker_image=$(docker images -q php-fpm)
if [ "$docker_image" ]
then
  docker rmi $docker_image
  docker build --rm -t php-fpm:5.5.9 php-fpm
fi
