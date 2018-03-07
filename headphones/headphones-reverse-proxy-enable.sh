#!/bin/bash
# Script Name: AtoMiC Headphones Reverse Proxy Enable.

if sed -i "/http_root/c\\http_root = /headphones" "$APPSETTINGS"; then
    echo "Updated http_root in $APPSETTINGS"
fi
