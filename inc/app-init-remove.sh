#!/bin/bash

echo
sleep 1

echo -e "$YELLOW--->Removing $APPTITLE Init.d startup scripts...$ENDCOLOR"

if [[ -f /etc/init.d/$APPINITD ]]; then
    sudo update-rc.d -f $APPINITD remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
    sudo rm /etc/init.d/$APPINITD || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }
    echo "/etc/init.d/$APPINITD init script removed"
else
    echo "/etc/init.d/$APPINITD init script not found"
fi

#Remove the PID file and folder if it exists
if [[ -d /var/run/$APPNAME ]]; then
    sudo rm -r /var/run/$APPNAME
fi

#Remove a conf file if there is one
if [[ -f /etc/$APPNAME.conf ]]; then
    sudo rm -r /etc/$APPNAME.conf
elif [[ -f /etc/init/$APPNAME.conf ]]; then
    sudo rm -r /etc/init/$APPNAME.conf
fi

echo
echo -e "$YELLOW--->Removing $APPTITLE default config scripts...$ENDCOLOR"
if [[ -f /etc/default/$APPNAME ]]; then
    sudo rm /etc/default/$APPNAME || { echo -e $RED'Warning! Removing default script failed.'$ENDCOLOR ; }
    echo "/etc/default/$APPNAME default script removed"
else
    echo "/etc/default/$APPNAME default script not found"
fi
