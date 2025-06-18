#!/bin/bash

##

reset

clear

##

## set -e

set -x

##

cd /tmp/

rm -rf install-docker

git clone https://github.com/softwareshinobi/provision-docker-aws-ec2-ubuntu.git install-docker

cd install-docker

##

echo "STARTING installing docker"

sudo bash provision.bash

echo "COMPLETE installing docker"
