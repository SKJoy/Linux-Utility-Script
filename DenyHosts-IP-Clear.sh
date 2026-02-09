#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

IP_TO_REMOVE=$1

# Check if an IP address was provided as an argument
if [ -z "$IP_TO_REMOVE" ]; then
    echo "Usage: $0 IP_TO_REMOVE"
    exit 1
fi

ESCAPED_IP=$(echo "$IP_TO_REMOVE" | sed 's/\./\\&/g')
HOSTS_DENY_PATH="/var/lib/denyhosts/"

systemctl stop denyhosts

sed -i "/${ESCAPED_IP}/d" /etc/hosts.deny
sed -i "/${ESCAPED_IP}/d" "${HOSTS_DENY_PATH}hosts"
sed -i "/${ESCAPED_IP}/d" "${HOSTS_DENY_PATH}hosts-restricted"
sed -i "/${ESCAPED_IP}/d" "${HOSTS_DENY_PATH}hosts-root"
sed -i "/${ESCAPED_IP}/d" "${HOSTS_DENY_PATH}hosts-valid"
sed -i "/${ESCAPED_IP}/d" "${HOSTS_DENY_PATH}users-hosts"
sed -i "/${ESCAPED_IP}/d" "${HOSTS_DENY_PATH}users-invalid"
sed -i "/${ESCAPED_IP}/d" "${HOSTS_DENY_PATH}users-valid"

systemctl start denyhosts
systemctl restart sshd

# Show result
cat <<CONTENT

Usage: bash $0 IP_TO_REMOVE
- IP_TO_REMOVE = 111.222.123.234

IP address removed from deny hosts
- ${IP_TO_REMOVE}

CONTENT
