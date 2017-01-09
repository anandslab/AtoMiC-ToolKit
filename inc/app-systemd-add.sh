#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Enabling '$APPTITLE' Autostart at Boot...'$ENDCOLOR
sudo cp $APPPATH/$APPSYSTEMDLOC /etc/systemd/system/$APPSYSTEMD || { echo $RED'Creating systemd file failed.'$ENDCOLOR ; exit 1; }
sudo systemctl enable $APPSYSTEMD
