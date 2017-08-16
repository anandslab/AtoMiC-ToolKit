#!/bin/bash
# Script Name: AtoMiC Plex Media Server default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo -e "${YELLOW}--->Updating Default file...$ENDCOLOR"

# [required] user or uid of account to run the program as:
sudo sed -i "s@PLEX_MEDIA_SERVER_USER=plex@PLEX_MEDIA_SERVER_USER=$UNAME@g" /etc/default/$APPNAME || { echo -e $RED'Replacing PLEX_MEDIA_SERVER_USER failed.'$ENDCOLOR ; exit 1; }

echo 'Updated Default file with new values'
