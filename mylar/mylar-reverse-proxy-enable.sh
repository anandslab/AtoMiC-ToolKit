#!/bin/bash
# Script Name: AtoMiC Lazy Mylar Reverse Proxy enable.

if sed -i "/http_root/c\\http_root = /mylar/" "$APPSETTINGS"; then
    echo "Updated http_root in $APPSETTINGS"
fi
