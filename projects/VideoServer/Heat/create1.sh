#!/bin/bash

CWD="$(pwd)"
declare -a arrayname=( CloudCentral Edge1 Edge2 )
for i in "${arrayname[@]}";
do
   source $CWD/"$i"/edge-use-cases-openrc.sh
   ansible-playbook deployserver.yml --extra-vars="myvarfile=$CWD/"$i"/variable.json"
 done

ansible-playbook updateDns.yml
ansible-playbook deployDocker.yml

ansible-playbook deploypeertubes.yml
ansible-playbook restApiToFollowIntances.yml
