#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

MY_NAME="John Doe"
echo "This custom BASH script is created by ${MY_NAME}. It is executed on Linux ${LINUX_DISTRIBUTION} at ${CURRENT_DATE_TIME}."

# Show result
cat <<CONTENT

- LINUX_DISTRIBUTION = "${LINUX_DISTRIBUTION}"
- CURRENT_DATE = "${CURRENT_DATE}"
- CURRENT_TIME = "${CURRENT_TIME}"
- CURRENT_DATE_TIME = "${CURRENT_DATE_TIME}"
- SCRIPT_PATH = "${SCRIPT_PATH}"

CONTENT
