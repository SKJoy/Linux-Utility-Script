#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

SERVER_URL=$1
WORKSPACE_ID=$2

if [[ "$LINUX_DISTRIBUTION" == $LINUX_DISTRIBUTION_ALPINE ]]; then
	REPORTER_FILENAME="tianji-reporter-linux"
	BINARY_PATH="/usr/local/tianji/"
	REPORTER_PATH="${BINARY_PATH}reporter/"
	REPORTER_FILE="${REPORTER_PATH}${REPORTER_FILENAME}"

	pgrep -f ${REPORTER_FILENAME} | xargs kill
	rm -rf ${BINARY_PATH}
	mkdir -p ${REPORTER_PATH}
	wget --no-check-certificate "https://github.com/msgbyte/tianji/releases/latest/download/${REPORTER_FILENAME}-amd64-alpine" -O ${REPORTER_FILE}
	chmod +x ${REPORTER_FILE}

	${REPORTER_FILE} --url "https://${SERVER_URL}" --workspace "${WORKSPACE_ID}" > /dev/null 2>&1 &
else
	INSTALLTION_URL="https://${SERVER_URL}/serverStatus/${WORKSPACE_ID}/install.sh?url=${SERVER_URL}"

	curl -o- ${INSTALLTION_URL} | bash
	curl -o- ${INSTALLTION_URL} | bash -s -- reset_conf
fi

# Show result
cat <<CONTENT

Usage: bash $0 SERVER_URL WORKSPACE_ID
- SERVER_URL   = "domain.com"
- WORKSPACE_ID = "abcdefghijklmnopqrstuvwxy"

Note
- HTTPS only

Tianji reporter started in the background
- ${SERVER_URL}
- ${WORKSPACE_ID}

CONTENT
