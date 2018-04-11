#!/bin/bash
# Script Name: AtoMiC Aria2 systemd update

if sudo sed -i "s@User=ReplaceMe@User=$UNAME@g" "/etc/systemd/system/$APPSYSTEMD" || \
        { echo -e "${RED}Modifying USER in SYSTEMD file failed.$ENDCOLOR"; exit 1; }; then
    echo "Set USER to $UNAME"
fi

if sudo sed -i "s@Group=ReplaceMe@Group=$UGROUP@g" "/etc/systemd/system/$APPSYSTEMD" || \
        { echo -e "${RED}Modifying GROUP in SYSTEMD file failed.$ENDCOLOR"; exit 1; }; then
    echo "Set GROUP to $UGROUP"
fi

if sudo sed -i "s@UNAME@$UNAME@g" "/etc/systemd/system/$APPSYSTEMD" || \
        { echo -e "${RED}Replacing PATH failed.$ENDCOLOR" ; exit 1; }; then
    echo "Set CONFIG PATH to $APPSETTINGSDIR"
fi
sudo systemctl daemon-reload
sudo systemctl enable $APPSYSTEMD
