#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Enabling '$APPTITLE' Autostart at Boot...'$ENDCOLOR
sudo chown $UNAME:$UGROUP /etc/init.d/$APPNAME
sudo chmod +x /etc/init.d/$APPNAME
sudo update-rc.d $APPNAME defaults