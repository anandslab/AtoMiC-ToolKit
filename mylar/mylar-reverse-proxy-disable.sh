#!/bin/bash
# Script Name: AtoMiC Lazy Mylar Reverse Proxy Disable.

if sed -i "/http_root/c\\http_root = \"\"" "$APPSETTINGS"; then
    echo "Updated http_root in $APPSETTINGS"
fi
