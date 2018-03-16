#!/bin/bash

echo
sleep 1
echo -e "$YELLOW--->Enabling $APPTITLE init.d startup script...$ENDCOLOR"
if [[ -n $APPINITDLOC ]]; then
    if sudo cp "$APPINITDLOC" "/etc/init.d/$APPINITD" || \
            { echo -e "${RED}Creating init file failed.$ENDCOLOR" ; exit 1; }; then
            sudo update-rc.d "$APPINITD" defaults
            echo "/etc/init.d/$APPINITD script added and enabled"
    fi
else
    echo "$APPINITDLOC not specified"
fi
