#!/bin/bash
echo
sleep 1

echo -e $YELLOW"--->Uninstalling $APPTITLE Dependencies..."$ENDCOLOR
sudo apt-get -y remove $APPDEPS
sudo apt-get -y autoremove
