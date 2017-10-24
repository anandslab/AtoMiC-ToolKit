#!/bin/bash
# Script Name: AtoMiC Syncthing Systemd Update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo -e "$YELLOW--->Enable Systemd Scripts...$ENDCOLOR"
sudo systemctl daemon-reload
sudo systemctl enable "$APPSYSTEMD"
sudo systemctl enable "$APPSYSTEMD2"
