#!/bin/bash
# Script Name: AtoMiC Kodi init.d update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo 'Updating init.d file'

sudo sed -i "s@RUN_AS=ReplaceMe@RUN_AS=$UNAME@g" /etc/init.d/$APPINITD || { echo -e $RED'Replacing RUN_AS failed.'$ENDCOLOR ; exit 1; }
