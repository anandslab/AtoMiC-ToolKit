#!/bin/bash
# Script Name: AtoMiC Deluge default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

# [optional] change to 1 to enable daemon

sudo sed -i "s@DELUGED_USER=\"ReplaceMe\"@DELUGED_USER=\"$UNAME\"@g" /etc/default/$APPNAME || { echo -e $RED'Replacing daemon DELUGED_USER in init failed.'$ENDCOLOR ; exit 1; }
