#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

DEFAULT_EDITOR=$1

if [ -z "$DEFAULT_EDITOR" ]; then
  DEFAULT_EDITOR="nano"
fi

FILE_TO_EDIT=~/.bashrc

if [[ "$EDITOR" == $DEFAULT_EDITOR ]]; then
	echo "- Nano is already the default editor"
else
	# if [ ! -f $FILE_TO_EDIT ]; then
	# 	FILE_TO_EDIT=~/.profile
	# fi

	echo "export EDITOR=\"${DEFAULT_EDITOR}\"" >> $FILE_TO_EDIT
	echo "export VISUAL=\"${DEFAULT_EDITOR}\"" >> $FILE_TO_EDIT
fi

# Show result
cat <<CONTENT

- EDITOR = "${EDITOR}"
- FILE_TO_EDIT = "${FILE_TO_EDIT}"
- Use "source ${FILE_TO_EDIT}" command to activate

CONTENT
