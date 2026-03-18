#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
# cd $SCRIPT_PATH # We need this to run in current working path

# Write your code below ---

# Check 1: Prevent root execution
if [[ $IS_ROOT_USER -eq 1 ]]; then
    echo "ERROR: This script should NOT run as root!" >&2
    exit 1
fi

BFN=$1

echo "Database name: " && read DB_NAME
echo "Database user: " && read DB_USER && DB_USER=${DB_USER:=${DB_NAME}}
echo "Database password: " && read DB_PASSWORD

unzip -o $BFN && \
    wp config set DB_NAME "${DB_NAME}" && \
    wp config set DB_USER "${DB_USER}" && \
    wp config set DB_PASSWORD "${DB_PASSWORD}" && \
    wp db reset --yes && \
    wp db import wordpress.sql && \
    rm -f wordpress.sql

# unzip -o $BFN && echo "Press ENTER to edit 'wp-config.php' to set new database credentials..." && read DUMMY_INPUT && nano wp-config.php && wp db import wordpress.sql && rm -f wordpress.sql

# Show result
cat <<CONTENT

Usage: bash $0 BACKUP_FILE
- BACKUP_FILE = "backup-file.zip"

Note
- WordPress CLI must be installed

CONTENT
