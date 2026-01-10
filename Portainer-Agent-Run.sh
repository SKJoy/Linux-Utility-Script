#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

AGENT_SECRET=$1
CONTAINER_NAME="portainer-agent"

docker container stop ${CONTAINER_NAME}
docker container rm ${CONTAINER_NAME}

docker run -d \
  -p 9001:9001 \
  -e AGENT_SECRET=${AGENT_SECRET} \
  --name ${CONTAINER_NAME} \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  portainer/agent:latest

# Show result
cat <<CONTENT

Usage: bash $0 SECRET
- SECRET  = "abcdefghijklmnopqrstuvwxy"

Note
- Requires Docker engine (service)

Portainer agent Docker container started
- Agent secret  : ${AGENT_SECRET}

CONTENT

