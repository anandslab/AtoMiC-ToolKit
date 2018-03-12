#!/bin/bash
# Script Name: AtoMiC Tautulli Reverse Proxy Enable.

if sed -i "/http_root/c\\http_root = /tautulli" "$APPSETTINGS"; then
    echo "Updated http_root in $APPSETTINGS"
fi

if sed -i "/http_proxy = 0/c\\http_proxy = 1" "$APPSETTINGS"; then
    echo "Updated http_proxy in $APPSETTINGS"
fi
