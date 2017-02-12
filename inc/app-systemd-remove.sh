#!/bin/bash
echo
sleep 1

echo -e $YELLOW"--->Removing $APPTITLE Systemd Autostart scripts..."$ENDCOLOR

#Check variable set
if [ ! -z ${APPSYSTEMD+x} ]; then
	#Check if the systemd file exists
	if [ -f /etc/systemd/system/$APPSYSTEMD ] || [ -f /lib/systemd/system/$APPSYSTEMD ] ; then
		sudo systemctl stop $APPSYSTEMD >/dev/null 2>&1
 		sudo systemctl disable $APPSYSTEMD >/dev/null 2>&1
		sudo rm /etc/systemd/system/$APPSYSTEMD  >/dev/null 2>&1
		sudo rm /lib/systemd/system/$APPSYSTEMD  >/dev/null 2>&1
		sudo systemctl daemon-reload
		echo "$APPSYSTEMD SystemD script removed"
		sleep 5
	else
		echo "$APPSYSTEMD SystemD script not found"
	fi
fi
