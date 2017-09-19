#!/bin/bash
# Script Name: AtoMiC Ombi init.d update
# Author: mgiljum
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo 'Updating init.d file'

sudo sed -i "s@DAEMON_USER=\"ReplaceMe\"@DAEMON_USER=\"$UNAME\"@g" /etc/init.d/$APPINITD || { echo -e $RED'Replacing RUN_AS failed.'$ENDCOLOR ; exit 1; }
