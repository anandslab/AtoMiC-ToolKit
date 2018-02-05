#!/bin/bash
# Script Name: AtoMiC Nginx Location Enabler
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "${YELLOW}---> Copy Reverse Proxy file over.$ENDCOLOR"

if [[ -d /etc/nginx/ ]]; then
    if [[ -z $NGINXCONF ]]; then
        NGINXCONF="$APPNAME.atomic.conf"
    fi

    if [[ ! -f "/etc/nginx/locations-enabled/$NGINXCONF" ]]; then
        if sudo ln -s "/etc/nginx/locations-available/$NGINXCONF" \
            "/etc/nginx/locations-enabled/$NGINXCONF"; then
            echo "Symlinked $NGINXCONF location file"
        fi
    else
        echo "Symlink for $NGINXCONF location already exists"
    fi
    sudo nginx -s reload
else
    echo "Nginx not found. Please install via the Utils menu and then try again."
fi
