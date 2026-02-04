#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

IP_TO_REMOVE=$1

# Check if an IP address was provided as an argument
if [ -z "$IP_TO_REMOVE" ]; then
    echo "Usage: $0 <IP_ADDRESS>"
    exit 1
fi

ESCAPED_IP=$(echo "$IP_TO_REMOVE" | sed 's/\./\\&/g')
HOSTS_DENY_PATH="/var/lib/denyhosts"

systemctl stop denyhosts

sed -i "/${ESCAPED_IP}/d" /etc/hosts.deny
sed -i "/${ESCAPED_IP}/d" "${HOSTS_DENY_PATH}/hosts"
sed -i "/${ESCAPED_IP}/d" "${HOSTS_DENY_PATH}/hosts-restricted"
sed -i "/${ESCAPED_IP}/d" "${HOSTS_DENY_PATH}/hosts-root"
sed -i "/${ESCAPED_IP}/d" "${HOSTS_DENY_PATH}/hosts-valid"
sed -i "/${ESCAPED_IP}/d" "${HOSTS_DENY_PATH}/users-hosts"

systemctl start denyhosts
systemctl restart sshd

# Show result
cat <<CONTENT

Usage: bash $0 IP_ADDRESS
- IP_ADDRESS = IP address to remove from the deny hosts list

IP address removed from deny hosts
- ${IP_ADDRESS}

CONTENT
