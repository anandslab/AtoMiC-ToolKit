#!/bin/bash
# Script Name: AtoMiC Madsonic default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com


echo -e "${YELLOW}--->Updating Default file...$ENDCOLOR"

# [required] user or uid of account to run the program as:
sudo sed -i "s@MADSONIC_USER=root@MADSONIC_USER=$UNAME@g" /etc/default/$APPNAME || { echo -e $RED'Replacing USER failed.'$ENDCOLOR ; exit 1; }

echo 'Updated Default file with new values'
