#!/bin/bash

echo
echo -e "${YELLOW}Setting temporary $APPTITLE WebUI password...$ENDCOLOR"
if [[ -n $UIPASS ]]; then
    sed -i 's|'"$PASSSEARCH$UIPASS"'|'"$PASSSEARCH$NEWPASS"'|g' $APPSETTINGS || { echo -e "${RED}Setting temporary password failed.$ENDCOLOR" ; exit 1; }
    echo -e "Password set to: $GREEN$NEWPASS$ENDCOLOR"
else
    echo -e "${RED}No password parameter found in config. Password cannot be reset.$ENDCOLOR Open $APPTITLE and set username and password."
fi
