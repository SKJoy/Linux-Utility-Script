#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
# cd $SCRIPT_PATH # We need this to run in current working path

# Write your code below ---

BFN=$1
unzip -o $BFN.zip` && echo "Press ENTER to edit 'wp-config.php' to set new database credentials..." && read DUMMY_INPUT && nano wp-config.php && wp db import wordpress.sql && rm -f wordpress.sql

# Show result
cat <<CONTENT

Usage: bash $0
- BACKUP_FILE = "backup.zip"

Note
"- WordPress CLI must be installed"

CONTENT
