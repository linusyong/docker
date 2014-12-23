Running Nginx and PHP-FPM Docker containers separately
==

1. First run **build_dockers.sh**
1. After the docker images are built, run **run_dockers.sh** to bring up the docker containers
1. **enter_docker.sh** is a bash script that wrapper around nsenter.  To get into a docker container, just use docker_enter.sh <container_name>
