#!/bin/bash

##

set -e

set -x

##

reset

clear

##

sudo bash 1-install-docker.bash

sudo bash 2-install-java.bash

sudo bash 3-create-user.bash

sudo bash 4-docker-login.bash

##

echo "finished JENKINS NODE provision"
