#!/bin/bash
# Script Name: AtoMiC Emby default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo -e $YELLOW'--->Updating Default file...'$ENDCOLOR

# [required] user or uid of account to run the program as:
sudo sed -i "s@EMBY_USER="emby"@EMBY_USER=$UNAME@g" /etc/default/$APPNAME || { echo -e $RED'Replacing EMBY_USER failed.'$ENDCOLOR ; exit 1; }

# [required] user or uid of account to run the program as:
sudo sed -i "s@EMBY_GROUP="emby"@EMBY_GROUP=$UNAME@g" /etc/default/$APPNAME || { echo -e $RED'Replacing EMBY_GROUP failed.'$ENDCOLOR ; exit 1; }

echo 'Updated Default file with new values'
