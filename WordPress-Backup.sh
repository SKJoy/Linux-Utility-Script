#!/bin/bash

# Load common library
source /Joy/Utility/Script/Common.sh

# Set working path to this script's path
cd $SCRIPT_PATH

# Write your code below ---

# Install WordPress CLI
cd /tmp
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp cli info

# Backup
echo "File name [wordpress]: " && read BFNP && BFNP=${BFNP:="wordpress"} && DT=$(date +%Y-%m-%d-%H-%M-%S)
BFN=$BFNP-$DT
rm -f wordpress.sql
wp db export wordpress.sql

zip -r9 $BFN.zip . \
	-x .tmb/\* \
	-x .well-known/\* \
	-x awstats-*/\* \
	-x cgi-bin/\* \
	-x icon/\* \
	-x .ftpquota \
	-x .user.ini \
	-x *_log \
	-x litespeed.conf \
	-x php.ini \
	-x *.zip \
	-x */cache/\* \
	-x */ignore-uploads/\* \
	-x */\*.log \
	-x */*/*.wpress

rm -f wordpress.sql
echo "- Backup file = ${BFN}.zip"
rm -f ignore-$BFN.zip

# Show result
cat <<CONTENT

Usage: bash $0

Result
"- Backup file = ${BFN}.zip"

CONTENT
