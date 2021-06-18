#!/bin/bash
SCRIPT_PATH="/home/alertrack/Documentos/projetos_alertrack/scripts/askpass.sh"

ip=$1
echo "========================================================================="
echo "========================================================================="
echo "Iniciando o script para sincronizar a maquina com o swarm"

read -p 'Nome de usuário: ' user

case $1 in
    "")
        read -p 'Ip do servidor: ' ip
    ;;
esac  

password=$("$SCRIPT_PATH")

echo "o ip: $ip"
echo "Usuário: $user" 
echo "Senha: $password"

"ssh $user@$ip 'bash -s' < script.sh"

echo "Finalizando o script para sincronizar a maquina $ip com o swarm"
echo "========================================================================="
echo "========================================================================="

