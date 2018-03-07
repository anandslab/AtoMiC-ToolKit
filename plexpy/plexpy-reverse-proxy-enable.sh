#!/bin/bash
# Script Name: AtoMiC PlexPy Reverse Proxy Enable.

if sed -i "/http_root/c\\http_root = /plexpy" "$APPSETTINGS"; then
    echo "Updated http_root in $APPSETTINGS"
fi

if sed -i "/http_proxy = 0/c\\http_proxy = 1" "$APPSETTINGS"; then
    echo "Updated http_proxy in $APPSETTINGS"
fi
