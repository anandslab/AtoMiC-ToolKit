#!/bin/bash
# Script Name: AtoMiC Lazy Librarian Reverse Proxy Enable.

if sed -i "/http_root/c\\http_root = /lazylibrarian/" "$APPSETTINGS"; then
    echo "Updated http_root in $APPSETTINGS"
fi
