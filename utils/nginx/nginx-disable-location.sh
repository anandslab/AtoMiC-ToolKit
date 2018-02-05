#!/bin/bash
# Script Name: AtoMiC Nginx Location Enabler
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "${YELLOW}---> Remove Reverse Proxy file.$ENDCOLOR"

if [[ -z $NGINXCONF ]]; then
    NGINXCONF="$APPNAME.atomic.conf"
fi

if [[ -f "/etc/nginx/locations-enabled/$APPNAME" ]]; then

    sudo rm "/etc/nginx/locations-enabled/$NGINXCONF"
    echo "Removed Symlink $NGINXCONF location file"

    sudo nginx -s reload
else
    echo "Nginx $NGINXCONF location file not found"
fi
