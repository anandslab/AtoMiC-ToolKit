#!/bin/bash

echo
cd $SCRIPTPATH || exit
source "$SCRIPTPATH/inc/pause.sh"
sudo bash "$SCRIPTPATH/inc/menu-$APPNAME.sh"
