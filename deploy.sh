#!/bin/bash

sudo usermod -aG docker ubuntu
git clone https://github.com/mohitwasnik132/java-hello-world.git
cd java-hello-world/
sudo apt install toilet -y >> /dev/null 2>&1
sudo apt install maven -y
sudo mvn clean install
clear
printf "\nHeading into container give image name, ports, container name as prompted"
printf "\n\n"

#name = "container name"

read -p "Enter image name:           " i_name
printf "\n\n"

printf "assign ports p1:p2"

read -p "Enter docker host port p1:             " p1
read -p "Enter docker container port p2:        " p2

printf "\n\nyour tcp port $p1 of docker host is assigned to port $p2 of container\n\n"

docker build -t "$i_name" .
printf "\n\n\n"
#name = "container name"
read -p "Enter container name:        " name
printf "\n\n\n"
clear
docker container stop "$name" >> /dev/null 2>&1
docker rm "$name" >> /dev/null 2>&1
sleep 1
clear
toilet -f pagga -F metal "Ready!!!!"

printf "\n\n"
echo "$(date '+%D %T' | toilet -f term -F border --gay)"
toilet -f pagga -F border:gay  "be lazy!!!"
printf "  your container >> $name << should be  running on docker image $i_name on ports $p1:$p2. Goodluck! \n\n"
docker container run --name "$name"  -p $p1:$p2 "$i_name"
