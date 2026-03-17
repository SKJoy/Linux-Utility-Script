#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
# cd $SCRIPT_PATH # We need this to run in current working path

# Write your code below ---

echo "Backup file name (do not include '.zip') [wordpress]: " && read BFN && BFN=${BFN:="wordpress"} && unzip -o $BFN.zip`
echo "Press ENTER to edit 'wp-config.php' to set new database credentials..." && read DUMMY_INPUT && nano wp-config.php

echo "Old domain: " && read OU && echo "New domain [old domain]: " && read NU && NU=${NU:="${OU}"} && echo "Migrating... please wait" && wp db import wordpress.sql && rm -f wordpress.sql && wp option update siteurl "https://${NU}" && wp option update home "https://${NU}" && wp search-replace "https://${OU}" "https://${NU}" --skip-columns=guid

# Show result
cat <<CONTENT

Usage: bash $0

Note
"- Backup file = ${BFN}.zip"
"- WordPress CLI must be installed"

CONTENT
