#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

if [[ "$LINUX_DISTRIBUTION" == $LINUX_DISTRIBUTION_ALPINE ]]; then
	apk add sudo openssl curl wget nano htop mc git
	apk update
	apk upgrade
else
	if [[ "$LINUX_DISTRIBUTION" == $LINUX_DISTRIBUTION_DEBIAN ]]; then
		apt-get clean
		apt-get -y install sudo openssl curl wget nano htop mc git
		apt-get update
		apt-get -y upgrade
	else
		if [[ "$LINUX_DISTRIBUTION" == $LINUX_DISTRIBUTION_RHEL ]]; then
			dnf clean all
			dnf -y install epel-release
			dnf -y install sudo openssl curl wget nano htop mc git
			dnf update
			dnf upgrade -y
		else
			echo "!!! UNKNOWN OPERATING SYSTEM !!!"
		fi
	fi
fi

# Show result
cat <<CONTENT

Usage: bash $0

Note
- Linux distribution: ${LINUX_DISTRIBUTION}
- Requires BASH
- Installs utilities like cURL, Open SSL, SUDo, BASH, HTop, Midnight Commander, etc.

CONTENT
