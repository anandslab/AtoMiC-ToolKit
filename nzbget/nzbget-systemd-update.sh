#!/bin/bash
# Script Name: AtoMiC NZBGet Systemd Update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sudo sed -i "s@User=ReplaceMe@User=$UNAME@g" /etc/systemd/system/$APPSYSTEMD || \
        { echo -e "${RED}Modifying USER in SYSTEMD file failed.$ENDCOLOR"; exit 1; }; then
    echo "Modifed USER to use $UNAME in SYSTEMD file"
fi

if sudo sed -i "s@Group=ReplaceMe@Group=$UGROUP@g" /etc/systemd/system/$APPSYSTEMD || \
        { echo -e "${RED}Modifying GROUP in SYSTEMD file failed.$ENDCOLOR"; exit 1; }; then
    echo "Modifed GROUP to use $UGROUP in SYSTEMD file"
fi

if sudo sed -i "s@</path/to.*>@$APPPATH/nzbget@g" /etc/systemd/system/$APPSYSTEMD || \
        { echo -e "${RED}Modifying $APPPATH in SYSTEMD file failed.$ENDCOLOR"; exit 1; }; then
    echo "Modifed $APPPATH in SYSTEMD file"
fi

sudo systemctl daemon-reload
sudo systemctl enable "$APPSYSTEMD"
