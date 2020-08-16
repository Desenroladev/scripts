#!/bin/bash

#Install the yum-utils package (which provides the yum-config-manager utility) and set up the stable repository.

yum install -y yum-utils

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo


#Install the latest version of Docker Engine and containerd, or go to the next step to install a specific version:
yum install docker-ce docker-ce-cli containerd.io

#Start Docker.
systemctl start docker

#Verify that Docker Engine is installed correctly by running the hello-world image.
docker run hello-world
