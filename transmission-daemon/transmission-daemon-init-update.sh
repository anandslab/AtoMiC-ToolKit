#!/bin/bash
# Script Name: AtoMiC Transmission init.d update

if [[ -f /etc/init.d/$APPINITD ]]; then
    echo 'Updating init.d file'
    if sudo sed -i "s@USER=debian-transmission@USER=$UNAME@g" /etc/init.d/transmission-daemon || \
            { echo -e "${RED}Replacing daemon username in init.d failed.$ENDCOLOR" ; exit 1; }; then
        echo "Set USER to $UNAME"
    fi
fi
