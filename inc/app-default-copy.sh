#!/bin/bash
if ! [[ $APPDEFAULTLOC = '' ]]; then
    cp $APPDEFAULTLOC /etc/default/$APPNAME || { echo -e $RED'Creating default file failed.'$ENDCOLOR; exit 1; }
    echo "Copied default file to /etc/default/$APPNAME"
    echo
fi
