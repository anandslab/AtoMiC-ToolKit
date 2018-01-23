#!/bin/bash
if [[ -f "$SCRIPTPATH/$APPNAME/$APPNAME-menu.sh" ]]; then
    if grep -q "Access Details" "$SCRIPTPATH/$APPNAME/$APPNAME-menu.sh"; then
        ACCESSSUPPORT="For access details, run the $APPTITLE Access Details utility."
    else
        ACCESSSUPPORT="You may now access $APPTITLE."
    fi
fi
echo "$ACCESSSUPPORT"
