#!/bin/bash
echo
sleep 1
echo -e $YELLOW"--->Installing $APPTITLE..."$ENDCOLOR
sudo apt-get install $APPNAME -y
