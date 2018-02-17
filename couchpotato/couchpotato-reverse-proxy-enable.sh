#!/bin/bash
# Script Name: AtoMiC Couchpotato Reverse Proxy Enable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i "/url_base/c\\url_base = /couchpotato" "$APPSETTINGS"; then
    echo "Updated url_base in $APPSETTINGS"
fi
