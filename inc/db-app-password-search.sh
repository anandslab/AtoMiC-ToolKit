#!/bin/bash
#Finds the password in a Datebase

if [[ -n $DBPASSSEARCH ]] && [[ -n $APPSETTINGS ]]; then
    UIPASS=$(echo "$DBPASSSEARCH" | sqlite3 "$APPSETTINGS")
    if [[ -n $UIPASS ]]; then
        UIPASS=$(echo "$UIPASS" | tr -dc '[:alnum:]')
    fi
fi
