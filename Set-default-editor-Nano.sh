#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

if [[ "$EDITOR" == "nano" ]]; then
	echo "- Nano is already the default editor"
else
	FILE_TO_EDIT="~/.profile"

	if [ -f "$FILE_TO_EDIT" ]; then
		X="Y"
	else
		FILE_TO_EDIT="~/.bashrc"
	fi
fi

# cat <<CONTENT >> $FILE_TO_EDIT
# export EDITOR="nano"
# export VISUAL="$EDITOR"
# CONTENT

# Show result
cat <<CONTENT

- FILE_TO_EDIT = "${FILE_TO_EDIT}"

CONTENT
