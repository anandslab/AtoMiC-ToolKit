#!/bin/bash
# Script Name: AtoMiC rTorrent init.d update

echo 'Updating init.d file'

sudo sed -i \
        "s@user=\"ReplaceMe\"@user=\"$UNAME\"@g" \
        "/etc/init.d/$APPINITD" || \
        { echo -e "$RED Replacing RUN_AS failed.$ENDCOLOR" ; exit 1; }

sudo sed -i \
        "s@sessiondir=\"ReplaceMe\"@sessiondir=\"/home/$UNAME/Downloads/rtorrent/session\"@g" \
        "/etc/init.d/$APPINITD" || \
        { echo -e "$RED Replacing sessiondir failed.$ENDCOLOR" ; exit 1; }
