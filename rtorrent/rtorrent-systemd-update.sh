#!/bin/bash
# Script Name: AtoMiC rTorrent Systemd Update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

sudo sed -i "s@User=ReplaceMe@User=$UNAME@g" "/etc/systemd/system/$APPSYSTEMD" \
|| { echo -e "${RED}Modifying USER in SYSTEMD file failed.$ENDCOLOR"; exit 1; }

sudo systemctl daemon-reload
sudo systemctl enable "$APPSYSTEMD"
