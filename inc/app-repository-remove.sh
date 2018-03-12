#!/bin/bash

echo
if [[ -n $APPREPOSITORYLINK ]]; then
    echo -e "$YELLOW--->Removing $APPTITLE repository...$ENDCOLOR"
    GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep $APPREPOSITORYNAME)
    if [[ -n $GREPOUT ]]; then
        if [[ $REPOPPA = 'YES' ]]; then
            sudo add-apt-repository --remove -y $APPREPOSITORYLINK
        else
            sudo rm "/etc/apt/sources.list.d/$APPREPOSITORYNAME.list"
            echo 'OK'
        fi
    else
        echo "$APPTITLE repository not found"
    fi

    source "$SCRIPTPATH/inc/app-keys-remove.sh"
fi
