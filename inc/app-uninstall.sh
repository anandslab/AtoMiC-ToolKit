#!/bin/bash
echo
sleep 1

echo -e $YELLOW'--->Uninstalling '$APPTITLE'...'$ENDCOLOR
sudo apt-get -y remove $APPNAME
sudo apt-get -y autoremove
