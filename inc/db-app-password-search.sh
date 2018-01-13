#!/bin/bash
#Finds the password in a Datebase

if [[ -n $DBPASSSEARCH ]] && [[ -n $APPSETTINGSDB ]]; then
    UIPASS=$(echo "$DBPASSSEARCH" | sqlite3 "$APPSETTINGSDB")
    if [[ -n $UIPASS ]]; then
        UIPASS=$(echo "$UIPASS" | tr -dc '[:alnum:]')
    fi
fi
