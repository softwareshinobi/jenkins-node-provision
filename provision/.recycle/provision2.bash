#!/bin/bash

##

set -e

set -x

##

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

bash jenkins.bash

##

echo "finished provision..."
