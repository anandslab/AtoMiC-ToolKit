#!/bin/bash
# Script Name: AtoMiC Syncthing init.d update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com

if [[ -f /etc/init.d/$APPINITD ]]; then
    echo "Updating $APPINITD file"
    
    sudo sed -i "s@REPLACEME@$UNAME@g" "/etc/init.d/$APPINITD" \
    || { echo -e "${RED}Replacing daemon username in $APPINITD failed.$ENDCOLOR" ; exit 1; }
fi
