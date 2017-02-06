#!/bin/bash
# Script Name: AtoMiC Transmission init.d update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo 'Updating init.d file'

sudo sed -i "s@USER_NAME@$UNAME@g" /etc/init.d/transmission-daemon  || { echo -e $RED'Replacing daemon username in init failed.'$ENDCOLOR ; exit 1; }
# sudo sed -i "s@setuid debian-transmission@setuid $UNAME@g" /etc/init.d/transmission.daemon  || { echo -e $RED'Replacing setuid failed.'$ENDCOLOR ; exit 1; }
# sudo sed -i "s@setgid debian-transmission@setgid $UGROUP@g" /etc/init.d/transmission-daemon  || { echo -e $RED'Replacing setgid failed.'$ENDCOLOR ; exit 1; }
