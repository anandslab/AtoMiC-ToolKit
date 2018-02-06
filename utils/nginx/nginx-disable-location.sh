#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Nginx Location Enabler
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
if [[ -z $1 ]]; then
    source "$SCRIPTPATH/inc/app-setup-check.sh"
    source "$SCRIPTPATH/inc/commons.sh"
    source "$SCRIPTPATH/inc/header.sh"
fi

echo -e "${YELLOW}---> Remove Reverse Proxy file.$ENDCOLOR"

if [[ -z $1 ]]; then
    source "$SCRIPTPATH/inc/pause.sh"
fi

if [[ -z $NGINXCONF ]]; then
    NGINXCONF="$APPNAME.atomic.conf"
fi

if [[ -L "/etc/nginx/locations-enabled/$NGINXCONF" ]]; then

    sudo rm "/etc/nginx/locations-enabled/$NGINXCONF"
    echo "Removed Symlink $NGINXCONF location file"

    sudo nginx -s reload
else
    echo "Nginx $NGINXCONF location file not found"
fi

if [[ -z $1 ]]; then
    source "$SCRIPTPATH/inc/thankyou.sh"
    source "$SCRIPTPATH/inc/exit.sh"
fi
