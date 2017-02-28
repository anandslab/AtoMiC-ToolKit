#!/bin/bash
# Script Name: AtoMiC pyLoad init.d update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo 'Updating init.d file'

sudo sed -i "s@USER=ReplaceMe@USER=$UNAME@g" /etc/init.d/$APPNAME || { echo -e $RED'Replacing USER failed.'$ENDCOLOR ; exit 1; }
