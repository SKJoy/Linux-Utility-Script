#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

PULSE_URL=$1
PULSE_TOKEN=$2

pkill 'pulse-agent'
curl -kfsSL ${PULSE_URL}/install.sh | bash -s -- --uninstall --url ${PULSE_URL}
curl -kfsSL ${PULSE_URL}/install.sh | bash -s -- --url ${PULSE_URL} --token ${PULSE_TOKEN} --interval 30s --insecure

# Show result
cat <<CONTENT

Usage: bash $0 URL TOKEN
- URL   = "https://pulse.domain.com"
- TOKEN = "abcdefghijklmnopqrstuvwxy"

Pulse Docker agent started in the background
- ${PULSE_URL}
- ${PULSE_TOKEN}

CONTENT
