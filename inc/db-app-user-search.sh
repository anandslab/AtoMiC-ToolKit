#!/bin/bash
#Finds the username in a Datebase

if [[ -n $DBUSERSEARCH ]] && [[ -n $APPSETTINGSDB ]]; then
    UINAME=$(echo "$DBUSERSEARCH" | sqlite3 "$APPSETTINGSDB")
    if [[ -n $UINAME ]]; then
        UINAME=$(echo "$UINAME" | tr -dc '[:alnum:]')
    fi
fi
