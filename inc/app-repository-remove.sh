#!/bin/bash
echo
if [ ! "$APPREPOSITORYLINK" == "" ]; then
    echo -e $YELLOW"--->Removing $APPTITLE repository..."$ENDCOLOR
    GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep $APPREPOSITORYNAME)
    if ! [ "$GREPOUT" == "" ]; then
        if [ "$REPOPPA" = 'YES' ]; then
            sudo add-apt-repository -r -y $APPREPOSITORYLINK
        else
            sudo rm /etc/apt/sources.list.d/$APPNAME.list
            echo 'OK'
        fi

        source $SCRIPTPATH/inc/app-keys-remove.sh

    else
        echo $APPTITLE' repository doesnt exist'
    fi
fi
