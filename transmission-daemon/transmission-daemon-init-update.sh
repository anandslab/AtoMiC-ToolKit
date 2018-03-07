#!/bin/bash
# Script Name: AtoMiC Transmission init.d update

if [[ -f /etc/init.d/$APPINITD ]]; then
    echo 'Updating init.d file'
    sudo sed -i "s@USER=debian-transmission@USER=$UNAME@g" /etc/init.d/transmission-daemon || { echo -e $RED'Replacing daemon username in init failed.'$ENDCOLOR ; exit 1; }
fi
