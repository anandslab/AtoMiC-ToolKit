#!/bin/bash
# Script Name: AtoMiC Nginx Location Enabler
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
if [[ $1 != 'SKIP' ]]; then
    source "$SCRIPTPATH/inc/commons.sh"
    source "$SCRIPTPATH/inc/header.sh"
fi

echo -e "${YELLOW}---> Copy Reverse Proxy file over.$ENDCOLOR"

if [[ $1 != 'SKIP' ]]; then
    source "$SCRIPTPATH/inc/pause.sh"
fi

if [[ -d /etc/nginx/ ]]; then
    if [[ -z $NGINXCONFNAME ]]; then
        NGINXCONFNAME="$APPNAME"
    fi

    source "$SCRIPTPATH/inc/app-stop.sh"

    if [[ ! -f /etc/nginx/locations-available/$NGINXCONFNAME.atomic.conf ]]; then
        if cp "$SCRIPTPATH/utils/nginx/locations-available/$NGINXCONFNAME.atomic.conf" \
                "/etc/nginx/locations-available/$NGINXCONFNAME.atomic.conf" || \
            { echo -e "${RED}Could not move location file $NGINXCONFNAME.atomic.conf over.$ENDCOLOR"; exit 1; }; then
            echo "Location file $NGINXCONFNAME.atomic.conf copied over to available"
        fi
    fi

    if [[ ! -L "/etc/nginx/locations-enabled/$NGINXCONFNAME.atomic.conf" ]]; then
        if sudo ln -s "/etc/nginx/locations-available/$NGINXCONFNAME.atomic.conf" \
            "/etc/nginx/locations-enabled/$NGINXCONFNAME.atomic.conf"; then
            echo "Symlinked $NGINXCONFNAME.atomic.conf location file"
        fi
    else
        echo "Symlink for $NGINXCONFNAME.atomic.conf location already exists"
    fi

    if [[ -f $SCRIPTPATH/$APPNAME/$APPNAME-reverse-proxy-enable.sh ]]; then
        source "$SCRIPTPATH/$APPNAME/$APPNAME-reverse-proxy-enable.sh"
    fi

    source "$SCRIPTPATH/utils/nginx/nginx-reload.sh"
    source "$SCRIPTPATH/inc/app-start.sh"

    if [[ $1 != 'SKIP' ]]; then
        source "$SCRIPTPATH/inc/app-http-responses.sh"
    fi
else
    echo "Nginx not found. Please install via the Utils menu and then try again."
fi

if [[ $1 != 'SKIP' ]]; then
    source "$SCRIPTPATH/inc/thankyou.sh"
    source "$SCRIPTPATH/inc/exit.sh"
fi
