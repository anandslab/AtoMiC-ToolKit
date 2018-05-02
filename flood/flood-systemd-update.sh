#!/bin/bash
# Script Name: AtoMiC Flood systemd update

ReplaceString "ReplaceMe" "$UNAME" "/etc/systemd/system/$APPSYSTEMD"

sudo systemctl daemon-reload
sudo systemctl enable "$APPSYSTEMD"
