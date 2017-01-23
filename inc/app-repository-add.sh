#!/bin/bash
echo
echo -e $YELLOW"--->Adding $APPTITLE repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep $APPREPOSITORYNAME)
if [ "$GREPOUT" == "" ]; then
    sudo add-apt-repository -y $APPREPOSITORYLINK
else
    echo $APPTITLE' repository already exists'
fi
