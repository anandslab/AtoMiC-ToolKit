#!/bin/bash
#Finds the username in the services config file

if [[ -n $USERSEARCH ]] && [[ -n $APPSETTINGS ]]; then
    UINAMESTRING=$(grep "$USERSEARCH" "$APPSETTINGS" | head -1)

    if [[ -n $UINAMESTRING ]]; then
        UINAME=${UINAMESTRING##*$USERSEARCH}
    fi
    
    if [[ -n $UINAME ]]; then
        UINAME=$(echo "$UINAME" | tr -dc '[:alnum:]')
    fi
fi
