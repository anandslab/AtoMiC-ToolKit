#!/bin/bash
echo
sleep 1
echo -e $YELLOW'You may access '$APPTITLE' with the following URLs...'$ENDCOLOR
if [ ! -z "$FQDN" ]; then
	echo -e '--->'$CYAN'http://'$FQDN':'$APPPORT$ENDCOLOR' from anywhere (requires port forwarding on router)'
fi
if [ ! -z "$WANIP" ]; then
	echo -e '--->'$CYAN'http://'$WANIP':'$APPPORT$ENDCOLOR' from anywhere (requires port forwarding on router)'
fi
if [ ! -z "$LANIP" ]; then
	echo -e '--->'$CYAN'http://'$LANIP':'$APPPORT$ENDCOLOR' from your local network'
fi
if [ ! -z "$HNAME" ]; then
	echo -e '--->'$CYAN'http://'$HNAME':'$APPPORT$ENDCOLOR' from your local network'
fi
echo -e '--->'$CYAN'http://localhost:'$APPPORT$ENDCOLOR' on this system'
echo -e 'Actual port numbers could be different. Check your settings file: '$APPSETTINGS
echo -e 'If SSL is enabled, then use HTTPS instead of HTTP in the above URLs.'
