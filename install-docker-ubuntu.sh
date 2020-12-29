#!/bin/bash

###	This file should be run in SUDO mode

### The script file needs to be executable, i.e.
#	chmod +x script.sh

#	Update package index

apt-get update

#	Install tools
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

#	Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

#	Setup stable repo
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#	Update package index (again)
apt-get update

#	Install latest version of Docker CE
apt-get install docker-ce -y

#	Run Hello World
docker run -d -e WALLARM_API_HOST=$7 -e DEPLOY_USER=$1 -e DEPLOY_PASSWORD=$2 -e NGINX_BACKEND=$3 -e TARANTOOL_MEMORY_GB=$4 -p 80:$5 $6
#docker run hello-world
