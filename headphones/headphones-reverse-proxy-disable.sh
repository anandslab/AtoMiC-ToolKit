#!/bin/bash
# Script Name: AtoMiC Headphones Reverse Proxy Disable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i "/http_root/c\\http_root = \"\"" "$APPSETTINGS"; then
    echo "updated http_root in $APPSETTINGS"
fi
