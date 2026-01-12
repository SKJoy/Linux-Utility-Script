#!/bin/bash

# Keep me up to date
git pull > /dev/null 2>&1 &

#region Constant
#region Linux distribution
LINUX_DISTRIBUTION_ALPINE="ALPINE"
LINUX_DISTRIBUTION_DEBIAN="DEBIAN"
LINUX_DISTRIBUTION_OTHER="OTHER"
LINUX_DISTRIBUTION_RHEL="RHEL"
#endregion Linux distribution

#endregion Constant

#region Detect time
CURRENT_DATE="$(date +%Y-%m-%d)";
CURRENT_TIME="$(date +%H-%M-%S)";
CURRENT_DATE_TIME="${CURRENT_DATE}-${CURRENT_TIME}";
#endregion Detect time

# Detect invoked BASH script path
SCRIPT_PATH="$(dirname "$(realpath $0)")/"

# Detect Linux distribution
if [[ -f /etc/alpine-release ]] || grep -q "ID=alpine" /etc/os-release; then
	LINUX_DISTRIBUTION=$LINUX_DISTRIBUTION_ALPINE
else
    source /etc/os-release

	if [[ "$ID" == "debian" ]] || [[ "$ID_LIKE" == *"debian"* ]]; then
		LINUX_DISTRIBUTION=$LINUX_DISTRIBUTION_DEBIAN
	else
		if [[ "$ID" == "rhel" ]] || [[ "$ID" == "centos" ]] || [[ "$ID" == "almalinux" ]] || [[ "$ID" == "rocky" ]]; then
			LINUX_DISTRIBUTION=$LINUX_DISTRIBUTION_RHEL
		else
			LINUX_DISTRIBUTION=$LINUX_DISTRIBUTION_OTHER
		fi
	fi
fi

# echo $LINUX_DISTRIBUTION
# echo $CURRENT_DATE
# echo $CURRENT_TIME
# echo $CURRENT_DATE_TIME
# echo $SCRIPT_PATH
