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

echo -e "${YELLOW}---> Copy Reverse Proxy file over.$ENDCOLOR"

if [[ -z $1 ]]; then
    source "$SCRIPTPATH/inc/pause.sh"
fi

if [[ -d /etc/nginx/ ]]; then
    if [[ -z $NGINXCONF ]]; then
        NGINXCONF="$APPNAME.atomic.conf"
    fi

    if [[ ! -L "/etc/nginx/locations-enabled/$NGINXCONF" ]]; then
        if sudo ln -s "/etc/nginx/locations-available/$NGINXCONF" \
            "/etc/nginx/locations-enabled/$NGINXCONF"; then
            echo "Symlinked $NGINXCONF location file"
        fi
    else
        echo "Symlink for $NGINXCONF location already exists"
    fi
    sudo nginx -s reload

    if [[ -z $1 ]]; then
        source "$SCRIPTPATH/inc/app-http-responses.sh"
    fi
else
    echo "Nginx not found. Please install via the Utils menu and then try again."
fi

if [[ -z $1 ]]; then
    source "$SCRIPTPATH/inc/thankyou.sh"
    source "$SCRIPTPATH/inc/exit.sh"
fi
