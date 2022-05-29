#!/bin/bash

apt-get remove docker docker-engine docker.io containerd runc

apt-get update

apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo ""

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list 

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo -e "\n\n"
docker --version && \
	echo -e "[INFO]: If you see the docker version in the previous line, then \"docker\" is installed and ready.\nOtherwise somthing went wrong!"

exit 0
