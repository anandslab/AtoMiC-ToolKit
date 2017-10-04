#!/bin/bash
echo
echo -e "$YELLOW--->Removing AtoMiC-ToolKit Nginx config file...$ENDCOLOR"
if [[ -f /etc/nginx/sites-available/$APPSETTINGS ]]; then
    sudo rm "/etc/nginx/sites-available/$APPSETTINGS" >/dev/null 2>&1
    echo "/etc/nginx/sites-available/$APPSETTINGS removed"
else
    echo "/etc/nginx/sites-available/$APPSETTINGS not found"
fi

if [[ -L /etc/nginx/sites-enabled/$APPSETTINGS ]]; then
    sudo rm "/etc/nginx/sites-enabled/$APPSETTINGS" >/dev/null 2>&1
    echo "/etc/nginx/sites-enabled/$APPSETTINGS removed"
else
    echo "/etc/nginx/sites-enabled/$APPSETTINGS not found"
fi
