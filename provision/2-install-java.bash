#!/bin/bash

##

set -e

set -x

##

reset

clear

##

sudo apt update

sudo apt install -y openjdk-21-jdk

##

java --version 
