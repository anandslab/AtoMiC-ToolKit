#!/bin/bash
echo
sleep 1

echo -e $YELLOW"--->Removing $APPTITLE Systemd Autostart scripts..."$ENDCOLOR

#Check variable set
if [ ! -z ${APPSYSTEMD+x} ]; then
	#Check if teh systemd file exists
	if [ -f /etc/systemd/system/$APPSYSTEMD ]; then
		sudo systemctl stop $APPSYSTEMD >/dev/null 2>&1
 		sudo systemctl disable $APPSYSTEMD >/dev/null 2>&1
		sudo rm /etc/systemd/system/$APPSYSTEMD || { echo -e $RED'Warning! Removing systemd script failed.'$ENDCOLOR ; }
		sudo systemctl daemon-reload
		echo "/etc/systemd/system/$APPSYSTEMD SystemD script removed"
		sleep 5
	else
		echo "/etc/systemd/system/$APPSYSTEMD SystemD script not found"
	fi
fi
