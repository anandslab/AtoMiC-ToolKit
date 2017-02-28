#!/bin/bash
echo 
echo -e $YELLOW"--->Stopping $APPTITLE..."$ENDCOLOR

if [ -f /etc/init.d/$APPNAME ]; then
	echo "/etc/init.d/$APPNAME Stopped"
	sudo service $APPNAME stop >/dev/null 2>&1
fi

if [[ -f /etc/systemd/system/$APPSYSTEMD ]] ; then
	echo "/etc/systemd/system/$APPSYSTEMD Stopped"
	sudo systemctl stop $APPSYSTEMD
fi

if [[ -f /lib/systemd/system/$APPSYSTEMD ]]; then
	echo "/lib/systemd/system/$APPSYSTEMD Stopped"
	sudo systemctl stop $APPSYSTEMD
fi

if [[ -f /etc/systemd/system/$APPSYSTEMD2 ]] ; then
	echo "/etc/systemd/system/$APPSYSTEMD2 Stopped"
	sudo systemctl stop $APPSYSTEMD2
fi

if [[ -f /lib/systemd/system/$APPSYSTEMD2 ]]; then
	echo "/lib/systemd/system/$APPSYSTEMD2 Stopped"
	sudo systemctl stop $APPSYSTEMD2
fi

sleep 2

sudo killall $APPNAME stop >/dev/null 2>&1
