#!/bin/bash
# Script Name: AtoMiC Headphones Reverse Proxy Enable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i "/http_root/c\\http_root = /headphones" "$APPSETTINGS"; then
    echo "Updated http_root in $APPSETTINGS"
fi
