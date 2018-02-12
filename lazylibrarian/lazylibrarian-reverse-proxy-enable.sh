#!/bin/bash
# Script Name: AtoMiC Lazy Librarian Reverse Proxy Enable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i "/http_root/c\\http_root = /lazylibrarian/" "$APPSETTINGS"; then
    echo "updated http_root in $APPSETTINGS"
fi
