#!/bin/bash
echo
sleep 1
echo -e $YELLOW"--->Enabling $APPTITLE init.d startup script..."$ENDCOLOR
if [[ ! -z $APPINITDLOC ]]; then
    sudo cp $APPINITDLOC /etc/init.d/$APPINITD || { echo -e $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
    sudo chown $UNAME:$UGROUP /etc/init.d/$APPINITD
    sudo chmod +x /etc/init.d/$APPINITD
    sudo update-rc.d "$APPINITD" defaults
    echo "/etc/init.d/$APPINITD script added and enabled"
else
    echo "$APPINITDLOC not specified"
fi
