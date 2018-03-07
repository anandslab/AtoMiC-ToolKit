#!/bin/bash

echo
sleep 1
echo -e "${YELLOW}--->Installing $APPTITLE...$ENDCOLOR"
sudo apt-get -o Dpkg::Options::="--force-confnew" install $APPNAME -y
echo
