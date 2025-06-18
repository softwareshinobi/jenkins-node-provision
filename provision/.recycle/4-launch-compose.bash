#!/bin/bash

##

set -e

set -x

##

reset

clear

##

docker compose up -d

sleep 8

curl localhost:80

##

echo "finished provision..."
