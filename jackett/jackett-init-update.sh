#!/bin/bash
# Script Name: AtoMiC Jackett init.d update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com

echo 'Updating init.d file'

sudo sed -i "s@user=\"ReplaceMe\"@user=\"$UNAME\"@g" \
"/etc/init.d/$APPINITD" || \
{ echo -e "$RED Replacing USER failed.$ENDCOLOR" ; exit 1; }
