#!/bin/bash

##

set -e

set -x

##

reset

clear

##

sudo apt update

##

apt install -y wget curl

apt install -y net-tools iputils-ping dnsutils
