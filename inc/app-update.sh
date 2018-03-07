#!/bin/bash

echo
sleep 1
echo -e "$YELLOW--->Updating $APPTITLE...$ENDCOLOR"
sudo apt-get -y install --only-upgrade "$APPNAME"
