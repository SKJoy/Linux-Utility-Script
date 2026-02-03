#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

SERVER_DOMAIN=$1
PULSE_TOKEN=$2

curl -kfsSL https://${SERVER_DOMAIN}/install.sh | bash -s -- --url https://${SERVER_DOMAIN} --token ${PULSE_TOKEN} --interval 30s --insecure

# Show result
cat <<CONTENT

Usage: bash $0 SERVER_DOMAIN PULSE_TOKEN
- SERVER_DOMAIN   = "pulse.domain.com"
- PULSE_TOKEN = "abcdefghijklmnopqrstuvwxy"

Note
- HTTPS only

Pulse Docker agent started in the background
- ${SERVER_DOMAIN}
- ${PULSE_TOKEN}

CONTENT
