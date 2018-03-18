#!/bin/bash
# Script Name: AtoMiC Ombi Systemd Update

if sudo sed -i "s@User=ReplaceMe@User=$UNAME@g" "/etc/systemd/system/$APPSYSTEMD" || \
        { echo -e "${RED}Modifying USER in SYSTEMD file failed.$ENDCOLOR"; exit 1; }; then
    echo "Set USER to $UNAME"
fi

if sudo sed -i "s@Group=ReplaceMe@Group=$UGROUP@g" "/etc/systemd/system/$APPSYSTEMD" || \
        { echo -e "${RED}Modifying GROUP in SYSTEMD file failed.$ENDCOLOR"; exit 1; }; then
    echo "Set GROUP to $UGROUP"
fi

sudo systemctl daemon-reload
sudo systemctl enable $APPSYSTEMD
