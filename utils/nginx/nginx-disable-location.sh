#!/bin/bash
# Script Name: AtoMiC Nginx Location Enabler
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
if [[ -z $1 ]]; then
    source "$SCRIPTPATH/inc/commons.sh"
    source "$SCRIPTPATH/inc/header.sh"
fi

echo -e "${YELLOW}---> Remove Reverse Proxy file.$ENDCOLOR"

if [[ -z $1 ]]; then
    source "$SCRIPTPATH/inc/pause.sh"
fi

source "$SCRIPTPATH/inc/app-stop.sh"

if [[ -z $NGINXCONFNAME ]]; then
    NGINXCONFNAME="$APPNAME"
fi

if [[ -f $SCRIPTPATH/$APPNAME/$APPNAME-reverse-proxy-disable.sh ]]; then
    source "$SCRIPTPATH/$APPNAME/$APPNAME-reverse-proxy-disable.sh"
fi

if [[ -L "/etc/nginx/locations-enabled/$NGINXCONFNAME.atomic.conf" ]]; then

    sudo rm "/etc/nginx/locations-enabled/$NGINXCONFNAME.atomic.conf"
    echo "Removed Symlink $NGINXCONFNAME.atomic.conf location file"

    source "$SCRIPTPATH/utils/nginx/nginx-reload.sh"
else
    echo "Nginx $NGINXCONFNAME.atomic.conf location file not found"
fi

source "$SCRIPTPATH/inc/app-start.sh"

if [[ -z $1 ]]; then
    source "$SCRIPTPATH/inc/thankyou.sh"
    source "$SCRIPTPATH/inc/exit.sh"
fi
