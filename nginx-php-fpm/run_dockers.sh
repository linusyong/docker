#!/bin/sh
echo -e "Running PHP-FPM docker container..."
php-fpm/run_docker.sh

echo -e "\nRunning Nginx docker container..."
nginx/run_docker.sh

echo -e "\nRunning HAProxy docker container..."
haproxy/run_docker.sh

sleep 2
x_powered_by=$(curl -Iq http://localhost/info.php 2>/dev/null | grep X-Powered-By)
if [ "$x_powered_by" ]
then
  echo -e "\nDocker containers are ready\n"
else
  echo -e "\nDocker containers not running properly\n"
fi
