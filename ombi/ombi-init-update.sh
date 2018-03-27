#!/bin/bash
# Script Name: AtoMiC Ombi init.d update

echo 'Updating init.d file'
if sudo sed -i "s@DAEMON_USER=\"ReplaceMe\"@DAEMON_USER=\"$UNAME\"@g" "/etc/init.d/$APPINITD" || \
        { echo -e "${RED}Replacing DAEMON_USER failed.$ENDCOLOR" ; exit 1; }; then
    echo "Set DAEMON_USER to $UNAME"
fi
