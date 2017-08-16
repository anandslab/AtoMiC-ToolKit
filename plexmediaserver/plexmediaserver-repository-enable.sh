#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Plex Media Server Repo Enable
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo -e "${YELLOW}--->Enable Sources file...$ENDCOLOR"

# Enables the repo for future updates
sudo sed -i "s@#$APPREPOSITORYLINK@$APPREPOSITORYLINK@g" /etc/apt/sources.list.d/plexmediaserver.list || { echo -e "${RED}Modifying plexmediaserver.list file failed.$ENDCOLOR"; exit 1; }
echo 'OK'
