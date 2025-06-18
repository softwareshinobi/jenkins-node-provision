#!/bin/bash

##

reset

clear

##

set -x

set -e

##

cd provision

sudo bash provision.bash

cd ..

##

echo "finished provisioning jenkins user"
