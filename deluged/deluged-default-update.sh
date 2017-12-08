#!/bin/bash
# Script Name: AtoMiC Deluge default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com

echo -e "${YELLOW}--->Updating Default file...$ENDCOLOR"

sudo sed -i "s@DELUGED_USER=\"ReplaceMe\"@DELUGED_USER=\"$UNAME\"@g" "/etc/default/$APPNAME" || { echo -e "${RED}Replacing daemon DELUGED_USER in init failed.$ENDCOLOR" ; exit 1; }

echo 'Updated Default file with new values'
