#!/bin/bash
echo 
echo -e $YELLOW"--->Stopping $APPTITLE..."$ENDCOLOR

if [ -f /etc/init.d/$APPNAME ]; then
	sudo service $APPNAME stop >/dev/null 2>&1
fi


if [[ -f /etc/systemd/system/$APPSYSTEMD ]] || [[ -f /lib/systemd/system/$APPSYSTEMD ]]; then
	sudo systemctl stop $APPSYSTEMD
fi

sleep 2

sudo killall $APPNAME stop >/dev/null 2>&1
