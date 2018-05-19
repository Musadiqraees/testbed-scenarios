#!/bin/bash

ansible '!sippstress:!etcd:!swarm_manager' -b -m shell -a 'containers=$(docker ps -q --no-trunc --filter name=bitflow-collector); echo "Restarting $(echo "$containers" | wc -l) containers..."; for i in $containers; do docker restart $i; done'
