#!/bin/bash

HOSTNAME=$(hostname -I)
# 69.69.69.177

echo "teste dentro do servidor download_master $HOSTNAME"

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

echo $1 | sudo -S mkdir -p /docker/swarm/selenoid

docker swarm leave --force  

docker swarm init 

docker stack deploy -c $HOME/Downloads/portainer-agent-stack.yml portainer --prune