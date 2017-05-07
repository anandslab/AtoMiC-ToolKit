#!/bin/bash
echo
echo -e "$YELLOW--->Removing $APPTITLE Nginx config files...$ENDCOLOR"
if [[ -f /etc/nginx/sites-available/$APPNAME ]]; then
    sudo rm "/etc/nginx/sites-available/$APPNAME"
    echo "/etc/nginx/sites-available/$APPNAME removed"
else
    echo "/etc/nginx/sites-available/$APPNAME not found"
fi

if [[ -L /etc/nginx/sites-enabled/$APPNAME ]]; then
    sudo rm "/etc/nginx/sites-enabled/$APPNAME"
    echo "/etc/nginx/sites-enabled/$APPNAME removed"
else
    echo "/etc/nginx/sites-enabled/$APPNAME not found"
fi
