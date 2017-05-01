#!/bin/bash
# Script Name: AtoMiC rTorrent settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo
echo -e "$YELLOW--->Configuring rTorrent Settings...$ENDCOLOR"

echo 'Coping rtorrent.rc to home dir'
sudo cp "$SCRIPTPATH/rtorrent/rtorrent.rc" "/home/$UNAME/.rtorrent.rc" || \
        { echo -e "$RED Coping rtorrent.rc failed.$ENDCOLOR" ; exit 1; }

echo 'Setting rtorrent.rc owner'
sudo chown "$UNAME":"$UGROUP" "/home/$UNAME/.rtorrent.rc"
