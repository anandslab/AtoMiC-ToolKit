#!/bin/bash
# Script Name: AtoMiC Sonarr Systemd Update

ReplaceString "User=ReplaceMe" "User=$UNAME" "/etc/systemd/system/$APPSYSTEMD"
ReplaceString "Group=ReplaceMe" "Group=$UGROUP" "/etc/systemd/system/$APPSYSTEMD"

sudo systemctl daemon-reload
sudo systemctl enable "$APPSYSTEMD"
