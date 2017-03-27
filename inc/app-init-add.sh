#!/bin/bash
echo
sleep 1
echo -e $YELLOW"--->Enabling $APPTITLE init.d Autostart at Boot..."$ENDCOLOR
if [[ ! -z $APPINITDLOC ]]; then
    sudo cp $APPINITDLOC /etc/init.d/$APPNAME || { echo -e $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
    sudo chown $UNAME:$UGROUP /etc/init.d/$APPNAME
    sudo chmod +x /etc/init.d/$APPNAME
    sudo update-rc.d "$APPNAME" defaults
    echo "/etc/init.d/$APPNAME script added and enabled"
else
    echo "$APPINITDLOC not specified"
fi

