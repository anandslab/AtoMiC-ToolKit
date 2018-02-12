#!/bin/bash
# Script Name: AtoMiC Medusa Reverse Proxy Enable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i "/web_root/c\\web_root = \"/medusa/\"" "$APPSETTINGS"; then
    echo "updated web_root in $APPSETTINGS"
fi

if sed -i "/handle_reverse_proxy = 0/c\\handle_reverse_proxy = 1" "$APPSETTINGS"; then
    echo "updated handle_reverse_proxy in $APPSETTINGS"
fi
