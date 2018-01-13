#!/bin/bash
# shellcheck disable=SC2034
# Script Name: AtoMiC Plex Media Server Repo Enable
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo -e "${YELLOW}--->Enable Sources file...$ENDCOLOR"
OLDREPO='#deb https://downloads.plex.tv/repo/deb/ public main'
if grep -Exq "$OLDREPO" /etc/apt/sources.list.d/plexmediaserver.list; then
    # Enables the repo for future updates
    sudo sed -i "s@$OLDREPO@$APPREPOSITORYLINK@g" /etc/apt/sources.list.d/plexmediaserver.list || { echo -e "${RED}Modifying plexmediaserver.list file failed.$ENDCOLOR"; exit 1; }
    OLDREPO=''
    echo 'OK'
else
    echo 'Update not required'
fi
