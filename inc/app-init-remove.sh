#!/bin/bash
echo
sleep 1

echo -e $YELLOW'--->Removing '$APPTITLE' Init.d Autostart scripts...'$ENDCOLOR

if [ -f /etc/init.d/$APPNAME ]; then
	sudo update-rc.d -f $APPNAME remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
	sudo rm /etc/init.d/$APPNAME || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }
fi

if [ -f /etc/default/$APPNAME ]; then
	sudo rm /etc/default/$APPNAME || { echo -e $RED'Warning! Removing default script failed.'$ENDCOLOR ; }
fi
