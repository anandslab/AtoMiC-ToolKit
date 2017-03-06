#!/bin/bash
# Script Name: AtoMiC PlexPy Systemd Update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

sudo sed -i '/Type=forking/a Restart=on-failure' /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Adding TYPE in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@User=plexpy@User=$UNAME@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying USER in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@Group=nogroup@Group=$UGROUP@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying GROUP in SYSTEMD file failed.'$ENDCOLOR; exit 1; }

sudo systemctl daemon-reload
sudo systemctl enable $APPSYSTEMD
