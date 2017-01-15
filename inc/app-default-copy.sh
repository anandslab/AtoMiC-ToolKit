#!/bin/bash
if ! [ $APPDEFAULTLOC == '' ]; then
    echo "Copy default file to /etc/default/$APPNAME"
    cp $APPDEFAULTLOC /etc/default/$APPNAME || { echo -e $RED'Creating default file failed.'$ENDCOLOR; exit 1; }
fi
