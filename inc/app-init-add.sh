#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Enabling '$APPTITLE' Autostart at Boot...'$ENDCOLOR
sudo cp $APPINITDLOC /etc/init.d/$APPNAME || { echo -e $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME:$UGROUP /etc/init.d/$APPNAME
sudo chmod +x /etc/init.d/$APPNAME
