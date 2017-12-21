#!/bin/bash
#Finds the password in the services config file

if [[ -n $PASSSEARCH ]] && [[ -n $APPSETTINGS ]]; then
    UIPASSSTRING=$(grep "$PASSSEARCH" "$APPSETTINGS" | head -1)
    
    if [[ -n $UIPASSSTRING ]]; then
        UIPASS=${UIPASSSTRING##*$PASSSEARCH}
    fi

    if [[ -n $UIPASS ]]; then
        UIPASS=$(echo "$UIPASS" | tr -dc '[:alnum:]')
    fi
fi
