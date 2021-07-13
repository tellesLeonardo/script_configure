case $4 in
"close")     
    sshpass -p $1 ssh -o StrictHostKeyChecking=no $2@$3 'bash -s' < $(pwd)/lib/scripts/config_docker/close_swarm.sh $1 
;;
"find")
    sshpass -p $1 ssh -o StrictHostKeyChecking=no $2@$3 'bash -s' < $(pwd)/lib/scripts/config_docker/return_swarn_token.sh $1 $4
;;
*)
    echo $(pwd)
    echo "sem case"
;;
esac

