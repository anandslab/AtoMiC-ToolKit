#!/bin/bash
# Script Name: AtoMiC qBittorrent init.d update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo 'Updating init.d file'
sudo sed -i "s@^USER=\"qbtuser\"@USER=\"$UNAME\"@g" /etc/init.d/$APPNAME || { echo -e $RED'Replacing RUN_AS failed.'$ENDCOLOR ; exit 1; }
sudo update-rc.d $APPNAME defaults
