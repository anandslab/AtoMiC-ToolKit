#!/bin/bash
# Script Name: AtoMiC Transmission systemd update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "$YELLOW--->Updating transmission-daemon.service.d/override.conf to run as $CYAN$UNAME$ENDCOLOR ...$ENDCOLOR"

sudo sed -i "s@User=ReplaceMe@User=$UNAME@g" /etc/systemd/system/transmission-daemon.service.d/override.conf || \
{ echo -e "${RED}Modifying USER in SYSTEMD file failed.$ENDCOLOR"; exit 1; }
sudo sed -i "s@Group=ReplaceMe@Group=$UGROUP@g" /etc/systemd/system/transmission-daemon.service.d/override.conf || \
{ echo -e "${RED}Modifying GROUP in SYSTEMD file failed.$ENDCOLOR"; exit 1; }

echo 'OK'
