#!/bin/bash
# shellcheck disable=SC1090
echo
cd $SCRIPTPATH
source "$SCRIPTPATH/inc/pause.sh"
sudo bash "$SCRIPTPATH/inc/menu-$APPNAME.sh"
