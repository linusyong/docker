#!/bin/bash

if [[ $# != 1 ]]; then
        echo "Usage: $0 <docker_container_name>"
        exit 1
fi
app=$1
pid=`docker inspect -f "{{.State.Pid}}" $app`
if [[ -z $pid ]]; then
        echo "$app is not a valid docker container"
        exit 1
else
        sudo nsenter -p -i -u -m -t $pid
fi
