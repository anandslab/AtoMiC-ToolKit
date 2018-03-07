#!/bin/bash
# Script Name: AtoMiC Syncthing Systemd Update

echo -e "$YELLOW--->Enable Systemd Scripts...$ENDCOLOR"
sudo systemctl daemon-reload
sudo systemctl enable "$APPSYSTEMD"
sudo systemctl enable "$APPSYSTEMD2"
