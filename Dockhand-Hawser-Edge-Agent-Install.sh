#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

DOCKHAND_BASE_URL=$1
DOCKHAND_AGENT_TOKEN=$2

DOCKHAND_URL="${DOCKHAND_BASE_URL}/api/hawser/connect"
CONFIGURATION_PATH="/etc/hawser"
CONFIGURATION_FILE="${CONFIGURATION_PATH}/config"

# Update system
# bash OS-Update.sh

# Install Hawser agent
curl -fsSL https://raw.githubusercontent.com/Finsys/hawser/main/scripts/install.sh | bash

# Write edge agent configuration file
mkdir -p ${CONFIGURATION_PATH}
echo "# Edge Mode Configuration" > ${CONFIGURATION_FILE}
echo "DOCKHAND_SERVER_URL=${DOCKHAND_URL}" >> ${CONFIGURATION_FILE}
echo "TOKEN=${DOCKHAND_AGENT_TOKEN}" >> ${CONFIGURATION_FILE}
echo "LOG_LEVEL=error" >> ${CONFIGURATION_FILE}
echo "" >> ${CONFIGURATION_FILE}
echo "# Connection settings" >> ${CONFIGURATION_FILE}
echo "HEARTBEAT_INTERVAL=30" >> ${CONFIGURATION_FILE}
echo "RECONNECT_DELAY=1" >> ${CONFIGURATION_FILE}
echo "MAX_RECONNECT_DELAY=60" >> ${CONFIGURATION_FILE}" >> ${CONFIGURATION_FILE}

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

Usage: bash $0 BASE_URL AGENT_TOKEN
- BASE_URL    = "wss://dockhand.domain.tld"
- AGENT_TOKEN = "abcdefghijklmnopqrstuvwxy"

Note
- WebSocket must be enabled
- Requires Docker engine (service)

Hawser agent service for Dockhand installed & started
- Base URL    : ${DOCKHAND_BASE_URL}
- Agent token : ${DOCKHAND_AGENT_TOKEN}

CONTENT

