#!/bin/bash
echo 
sleep 1
echo -e $YELLOW"--->Stopping $APPTITLE..."$ENDCOLOR

if [ -f /etc/init.d/$APPNAME ]; then
	sudo service $APPNAME stop >/dev/null 2>&1
fi

if [ ! -z ${APPSYSTEMD+x} ]; then
	if [ -f /etc/systemd/system/$APPSYSTEMD ]; then
		sudo systemctl stop $APPSYSTEMD
	fi
fi
sleep 2

sudo killall $APPNAME stop >/dev/null 2>&1
