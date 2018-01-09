#!/bin/bash

echo
sleep 1
echo -e "${YELLOW}--->Installing prerequisites for $APPTITLE...$ENDCOLOR"
sudo apt-get -y install $APPDEPS
