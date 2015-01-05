#!/bin/sh

## if confd is dead or running, remove it
container_id=$(docker ps -a | grep confd | cut -f1 -d\ )
if [ "$container_id" ]
then
  echo -n "Removing container: "
  docker rm -f $container_id
fi

GW_IP=$(ifconfig docker0 | grep inet\  | awk '{print $2}')

## now run confd docker container
#
# --name confd : name the docker container confd
# --net=host : use host networking for etcdctl to communicate
# --detach confd:0.7.1 : run detached and using nginx:latest docker image
#

echo -n "Running container: "
docker run \
  --env ETCDCTL_PEERS="http://$GW_IP:4001/" \
  --name confd \
  --detach confd:0.7.1
