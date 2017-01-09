#!/bin/bash
echo
sleep 1

echo -e $YELLOW'--->Removing '$APPTITLE' Systemd Autostart scripts...'$ENDCOLOR

if [ ! -z ${APPSYSTEMD+x} ]; then
	if [ -f /etc/systemd/system/$APPSYSTEMD ]; then
		sudo systemctl stop $APPSYSTEMD >/dev/null 2>&1
 		sudo systemctl disable $APPSYSTEMD >/dev/null 2>&1
		sudo rm /etc/systemd/system/$APPSYSTEMD || { echo -e $RED'Warning! Removing systemd script failed.'$ENDCOLOR ; }
		sudo systemctl daemon-reload
sleep 5
	fi
fi
