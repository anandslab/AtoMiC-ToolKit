#!/bin/bash
# Script Name: AtoMiC Syncthing init.d update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com

if [[ -f /etc/init.d/$APPINITD ]]; then
    echo 'Updating init.d file'
    sudo sed -i "s@USER=REPLACEME@USER=$UNAME@g" "/etc/init.d/$APPINITD" \
    || { echo -e "${RED}Replacing daemon username in $APPINITD failed.$ENDCOLOR" ; exit 1; }
fi

if [[ -f /etc/init.d/$APPINITD2 ]]; then
    echo 'Updating init.d file'
    sudo sed -i "s@GROUP=REPLACEME@GROUP=$UGROUP@g" "/etc/init.d/$APPINITD2" \
    || { echo -e "${RED}Replacing daemon username in $APPINITD2 failed.$ENDCOLOR" ; exit 1; }
fi
