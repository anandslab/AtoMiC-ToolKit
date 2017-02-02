#!/bin/bash
echo
sleep 1
echo -e $YELLOW"You may access $APPTITLE with the following URLs..."$ENDCOLOR
if [ ! -z "$WANIP" ]; then
	echo -e '--->'$CYAN'http://'$WANIP':'$APPDPORT$ENDCOLOR' from anywhere (requires port forwarding on router)'
fi
if [ ! -z "$LANIP" ]; then
	echo -e '--->'$CYAN'http://'$LANIP':'$APPDPORT$ENDCOLOR' from your local network'
fi
if [ ! -z "$HNAME" ]; then
	echo -e '--->'$CYAN'http://'$HNAME':'$APPDPORT$ENDCOLOR' from your local network'
fi
echo -e '--->'$CYAN'http://localhost:'$APPDPORT$ENDCOLOR' on this system'
echo -e 'Actual port numbers could be different. Check your settings file: '$APPSETTINGS
echo -e 'If SSL is enabled, then use HTTPS instead of HTTP in the above URLs.'
