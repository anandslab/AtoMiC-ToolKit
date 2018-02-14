#!/bin/bash
# Script Name: AtoMiC Medusa Reverse Proxy Disable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i "/web_root/c\\web_root = \"\"" "$APPSETTINGS"; then
    echo "Updated web_root in $APPSETTINGS"
fi

if sed -i "/handle_reverse_proxy = 1/c\\handle_reverse_proxy = 0" "$APPSETTINGS"; then
    echo "Updated handle_reverse_proxy in $APPSETTINGS"
fi
