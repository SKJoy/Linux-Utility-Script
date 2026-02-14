#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

PUBLIC_KEY=$1
TOKEN=$2
HUB_DOMAIN=$3

curl -sL https://get.beszel.dev -o /tmp/install-agent.sh && chmod +x /tmp/install-agent.sh
/tmp/install-agent.sh -u
/tmp/install-agent.sh -p 45876 -k "${PUBLIC_KEY}" -t "${TOKEN}" -url "${HUB_DOMAIN}" --auto-update

# CONTAINER_NAME="beszel-agent"

# docker container stop ${CONTAINER_NAME}
# docker container rm ${CONTAINER_NAME}

# docker run -d \
#   --name ${CONTAINER_NAME} \
#   --restart unless-stopped \
#   -e KEY="${PUBLIC_KEY}" \
#   -e LISTEN=45876 \
#   -e TOKEN="${TOKEN}" \
#   -e HUB_URL="https://${HUB_DOMAIN}" \
#   -v /var/run/docker.sock:/var/run/docker.sock:ro \
#   -p 45876:45876 \
#   henrygd/beszel-agent

# Show result
cat <<CONTENT

Usage: bash $0 SERVER_DOMAIN PULSE_TOKEN
- PUBLIC_KEY   = "GET_FROM_BESZEL_HUB"
- TOKEN        = "GET_FROM_BESZEL_HUB"
- HUB_DOMAIN   = "beszel.domain.tld"

Beszel agent started in the background
- ${PUBLIC_KEY}
- ${TOKEN}
- ${HUB_DOMAIN}

CONTENT
