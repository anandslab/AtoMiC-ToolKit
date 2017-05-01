#!/bin/bash
# Script Name: AtoMiC Resilio Sync systemd update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo
echo -e "${YELLOW}--->Updating systemd to run as user at logon ...$ENDCOLOR"

sudo sed -i "s@multi-user.target@default.target@g" "/usr/lib/systemd/user/$APPSYSTEMD" \
|| { echo -e "${RED}Modifying USER in SYSTEMD file failed.$ENDCOLOR"; exit 1; }

#Probably not required most of the time unless we've actually added a systemd file'
sudo systemctl daemon-reload >/dev/null 2>&1
sudo systemctl --user enable "$APPSYSTEMD" >/dev/null 2>&1

echo 'OK'
