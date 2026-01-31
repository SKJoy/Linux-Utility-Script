#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

DOCKHAND_DOMAIN=$1
AGENT_TOKEN=$2

DOCKHAND_URL="wss://${DOCKHAND_DOMAIN}/api/hawser/connect"
CONFIGURATION_PATH="/etc/hawser"
CONFIGURATION_FILE="${CONFIGURATION_PATH}/config"

bash OS-Update.sh

# Install Hawser agent
curl -fsSL https://raw.githubusercontent.com/Finsys/hawser/main/scripts/install.sh | bash

# Write edge agent configuration file
mkdir -p ${CONFIGURATION_PATH}
echo "DOCKHAND_SERVER_URL=${DOCKHAND_URL}" > ${CONFIGURATION_FILE}
echo "TOKEN=${AGENT_TOKEN}" >> ${CONFIGURATION_FILE}

# Configure system service
if [[ "$LINUX_DISTRIBUTION" == $LINUX_DISTRIBUTION_ALPINE ]]; then
	rc-update add hawser
	rc-service hawser stop
	rc-service hawser start
	rc-service hawser status
else
	systemctl enable --now hawser
	systemctl stop hawser
	systemctl start hawser
	# systemctl status hawser
fi

# Show result
cat <<CONTENT

Usage: bash $0 DOMAIN TOKEN
- DOMAIN = "domain.tld"
- TOKEN  = "abcdefghijklmnopqrstuvwxy"

Note
- HTTPS only
- WebSocket must be enabled (WSS)
- Requires Docker engine (service)

Hawser agent service for Dockhand installed & started
- Dockhand URL : ${DOCKHAND_URL}
- Agent token  : ${AGENT_TOKEN}

CONTENT

