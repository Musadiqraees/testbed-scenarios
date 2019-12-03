#!/bin/bash

CWD="$(pwd)"
declare -a arrayname=( CloudCentral Edge1 Edge2 FarEdge )
for i in "${arrayname[@]}";
do
  source $CWD/"$i"/edge-use-cases-openrc.sh
home=`dirname $(readlink -e $0)`
cd "$home"
"../../../heat-common/heat-create.sh" "video-server.yml" "video-server" "$i" $@
done
