

##

sudo apt install openjdk-21-jdk -y

java --version 

##

userr=`whoami`

sudo usermod -a -G docker $userr

id $userr

##

docker login
