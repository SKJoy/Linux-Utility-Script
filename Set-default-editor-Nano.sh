#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

FILE_TO_EDIT=~/.bashrc

if [[ "$EDITOR" == "nano" ]]; then
	echo "- Nano is already the default editor"
else
	# if [ ! -f $FILE_TO_EDIT ]; then
	# 	FILE_TO_EDIT=~/.profile
	# fi

	echo "export EDITOR=\"nano\"" >> $FILE_TO_EDIT
	echo "export VISUAL=\"nano\"" >> $FILE_TO_EDIT
fi

# Show result
cat <<CONTENT

- EDITOR = "${EDITOR}"
- FILE_TO_EDIT = "${FILE_TO_EDIT}"

CONTENT
