#!/bin/bash

HOSTNAME=$(hostname -I)

echo "teste dentro do servidor download_node $HOSTNAME"
# 192.168.1.112

echo $1 | sudo -S apt-get remove docker docker-engine docker.io containerd runc -y
echo "remove falta"
echo $1 | sudo -S curl -fsSL https://get.docker.com -o get-docker.sh 
echo "get docker"
echo $1 | sudo -S sh get-docker.sh
echo "get-docker.sh"
echo $1 | sudo -S systemctl unmask docker
echo "unmask docker"
echo $1 | sudo -S systemctl start docker
echo "start docker"

docker swarm join --token $2 $3