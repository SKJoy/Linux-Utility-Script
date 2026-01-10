#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

echo "- Operation can take a long time depending on depth"
echo "- Use CTRL + C to terminate at any moment"

rm -rf /.trash/*
rm -rf /root/.trash/*
rm -rf /home/*/.trash/*

# Show result
cat <<CONTENT

Usage: bash $0

Note: Paths include;
- Base trash
- Trash for "root" user
- Trash for all other users

CONTENT
