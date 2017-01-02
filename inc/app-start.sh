#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Starting '$APPTITLE'...'$ENDCOLOR

if [ -f /etc/init.d/$APPNAME ]; then
	sudo /etc/init.d/$APPNAME start >/dev/null 2>&1
fi

if [ ! -z ${APPSYSTEMD+x} ]; then
	if [ -f /etc/systemd/system/$APPSYSTEMD ]; then
		sudo systemctl start $APPSYSTEMD
	fi
fi
