#!/bin/bash
echo
echo -e $YELLOW"--->Removing $APPTITLE repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep $APPREPOSITORYNAME)
if ! [ "$GREPOUT" == "" ]; then
    sudo add-apt-repository -r -y $APPREPOSITORYLINK
else
    echo $APPTITLE' repository doesnt exist'
fi
