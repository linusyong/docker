#!/bin/bash

rm -rf nginx/exports/log/*
./stop_dockers.sh

docker_image=$(docker images -q nginx)
if [ "$docker_image" ]
then
  docker rmi $docker_image
fi
docker build --rm -t nginx:1.6.2 nginx

docker_image=$(docker images -q php-fpm)
if [ "$docker_image" ]
then
  docker rmi $docker_image
fi
docker build --rm -t php-fpm:5.5.9 php-fpm

docker_image=$(docker images -q haproxy)
if [ "$docker_image" ]
then
  docker rmi $docker_image
fi
docker build --rm -t haproxy:1.5.9 haproxy
