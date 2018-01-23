#!/bin/bash
# Script Name: AtoMiC Plex Media Server systemd update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "$YELLOW--->Updating systemd to run as $CYAN$UNAME$ENDCOLOR ...$ENDCOLOR"

sudo sed -i "s@User=ReplaceMe@User=$UNAME@g" /etc/systemd/system/plexmediaserver.service.d/override.conf || { echo -e $RED'Modifying USER in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@Group=ReplaceMe@Group=$UGROUP@g" /etc/systemd/system/plexmediaserver.service.d/override.conf || { echo -e $RED'Modifying GROUP in SYSTEMD file failed.'$ENDCOLOR; exit 1; }

#Probably not required most of the time unless we've actually added a systemd file'
sudo systemctl daemon-reload >/dev/null 2>&1
sudo systemctl enable $APPSYSTEMD  >/dev/null 2>&1

echo 'OK'
