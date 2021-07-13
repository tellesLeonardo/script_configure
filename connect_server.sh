#!/bin/bash

ip=$1
user=$2
password=$3
echo "========================================================================="
echo "========================================================================="
echo "Iniciando o script para sincronizar a maquina com o swarm"

echo $3 | sudo -S apt-get install sshpass -y
echo $3 | sudo -S yum install sshpass -y



echo "o ip: $1"
echo "Usuário: $2" 
echo "Senha: $3"
echo "Finalizando o script para sincronizar a maquina $1 com o swarm"

case $4 in
"node")
    echo $3 | sshpass -p $3 ssh -o StrictHostKeyChecking=no $2@$1 'bash -s' < $(pwd)/lib/scripts/config_docker/download_node.sh $3 $5 $6
;;
"master")
    
    echo $3
    sshpass -p $3 scp $(pwd)/lib/scripts/config_docker/portainer-agent-stack.yml $2@$1:~/Downloads/
   
    echo "teste" 
#    sshpass -p $3 ssh $2@$1 'bash -s' < $(pwd)/download_master.sh $3
    sshpass -p $3 ssh $2@$1 'bash -s' < $(pwd)/lib/scripts/config_docker/download_master.sh $3  
    
;;
*)
    echo "sem case"
;;
esac

