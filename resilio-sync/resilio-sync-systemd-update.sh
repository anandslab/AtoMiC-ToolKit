#!/bin/bash
# Script Name: AtoMiC Resilio Sync systemd update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "${YELLOW}--->Updating systemd to run as user at logon ...$ENDCOLOR"

sudo sed -i "s@User=ReplaceMe@User=$UNAME@g" /etc/systemd/system/$APPNAME.service.d/override.conf || { echo -e $RED'Modifying USER in SYSTEMD override file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@Group=ReplaceMe@Group=$UGROUP@g" /etc/systemd/system/$APPNAME.service.d/override.conf || { echo -e $RED'Modifying GROUP in SYSTEMD override file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@/home/ReplaceMe@/home/$UNAME@g" /etc/systemd/system/$APPNAME.service.d/override.conf || { echo -e $RED'Modifying LOCATION in SYSTEMD override file failed.'$ENDCOLOR; exit 1; }
