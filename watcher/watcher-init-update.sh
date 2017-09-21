#!/bin/bash
# Script Name: AtoMiC Watcher init.d update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo 'Updating init.d file'

sudo sed -i "s@DAEMON_USER=ReplaceMe@DAEMON_USER=$UNAME@g" /etc/init.d/$APPINITD || { echo -e $RED'Replacing DAEMON_USER failed.'$ENDCOLOR ; exit 1; }
