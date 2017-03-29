#!/bin/bash
# Script Name: AtoMiC SABnzbd+ default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo -e "${YELLOW}--->Updating Default file...$ENDCOLOR"

# [required] user or uid of account to run the program as:
sudo sed -i "s@USER=@USER=$UNAME@g" "/etc/default/$APPNAME" \
|| { echo -e "{$RED}Replacing USER failed.$ENDCOLOR" ; exit 1; }

# [optional] full path to the configuration file of your choice otherwise, 
# the default location (in $USER's home directory) is used:
sudo sed -i "s@CONFIG=@CONFIG=$APPSETTINGS@g" "/etc/default/$APPNAME" \
|| { echo -e "${RED}Replacing CONFIG failed.$ENDCOLOR" ; exit 1; }

echo 'Updated Default file with new values'
