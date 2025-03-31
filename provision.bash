#!/bin/bash

set -e

reset

clear

##

echo
echo "## "
echo "## routine / provision-ubuntu-basic / starting"
echo "## "
echo

##

sudo apt update

##

sudo apt -y install ca-certificates curl;

### APT package dependency setup

sudo install -m 0755 -d /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

## docker engine install

## sudo apt purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose docker docker.io

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

## sudo docker run hello-world

####

bash jenkins.bash

####

echo "finished provision..."