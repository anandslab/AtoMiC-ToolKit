#!/bin/bash
# Script Name: AtoMiC rTorrent init.d update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo 'Updating init.d file'

sudo sed -i \
        "s@user=\"ReplaceMe\"@user=\"$UNAME\"@g" \
        "/etc/init.d/$APPINITD" || \
        { echo -e "$RED Replacing RUN_AS failed.$ENDCOLOR" ; exit 1; }
