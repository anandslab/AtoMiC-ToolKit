#!/bin/bash
echo 
sleep 1
echo -e $YELLOW'--->Stopping '$APPTITLE'...'$ENDCOLOR
sudo /etc/init.d/$APPNAME stop >/dev/null 2>&1
