#!/bin/bash
echo
echo -e "$YELLOW--->Removing $APPTITLE Nginx config file...$ENDCOLOR"
if [[ -f /etc/nginx/sites-available/$APPNAME ]]; then
    sudo rm "/etc/nginx/sites-available/$APPNAME" >/dev/null 2>&1
    echo 'File removed'
else
    echo 'No file found'
fi