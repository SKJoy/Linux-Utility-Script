#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---



# Show result
cat <<CONTENT

- LINUX_DISTRIBUTION = "${LINUX_DISTRIBUTION}"
- CURRENT_DATE = "${CURRENT_DATE}"
- CURRENT_TIME = "${CURRENT_TIME}"
- CURRENT_DATE_TIME = "${CURRENT_DATE_TIME}"
- SCRIPT_PATH = "${SCRIPT_PATH}"

CONTENT
