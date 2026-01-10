#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

MAXIMUM_DIRECTORY_DEPTH=$1
BASE_PATH=$2
LOG_FILE_EXTENSION=$3

CURRENT_PATH=$BASE_PATH

if [[ -z "$MAXIMUM_DIRECTORY_DEPTH" ]]; then
  MAXIMUM_DIRECTORY_DEPTH=10
fi

if [[ -z "$BASE_PATH" ]]; then
  BASE_PATH="/"
fi

if [[ -z "$LOG_FILE_EXTENSION" ]]; then
  LOG_FILE_EXTENSION="log"
fi

for ((DIRECTORY_DEPTH=1; DIRECTORY_DEPTH<=MAXIMUM_DIRECTORY_DEPTH; DIRECTORY_DEPTH++)); do
	if (( DIRECTORY_DEPTH > 1 )); then
		CURRENT_PATH="${CURRENT_PATH}*/"
	fi

	echo "- Truncating files in \"${CURRENT_PATH}\""
	truncate -s 0 ${CURRENT_PATH}*.${LOG_FILE_EXTENSION} 2> /dev/null
done

# Show result
cat <<CONTENT

Usage: bash $0 DEPTH PATH EXTENSION
- DEPTH     = 3
- PATH      = "/My/Path/to/Scan"
- EXTENSION = "log"

- Path = "${BASE_PATH}"
- Depth = ${MAXIMUM_DIRECTORY_DEPTH}
- File extension = "${LOG_FILE_EXTENSION}"

CONTENT
