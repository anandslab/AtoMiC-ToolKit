#!/bin/bash
echo
echo -e $YELLOW"--->Removing $APPTITLE repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep $APPREPOSITORYNAME)
if ! [ "$GREPOUT" == "" ]; then
    if [ "$REPOPPA" = 'YES' ]; then
        sudo add-apt-repository -r -y $APPREPOSITORYLINK
    else
        sudo rm /etc/apt/sources.list.d/$APPNAME.list
        echo 'OK'
        if [ "$REPOKEYSREQ" = 'YES' ]; then
            source $SCRIPTPATH/inc/app-keys-remove.sh
        fi
    fi
else
    echo $APPTITLE' repository doesnt exist'
fi
