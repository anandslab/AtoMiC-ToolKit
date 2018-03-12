#!/bin/bash
# Script Name: AtoMiC Tautulli Reverse Proxy Disable.

if sed -i "/http_root/c\\http_root = \"\"" "$APPSETTINGS"; then
    echo "Updated http_root in $APPSETTINGS"
fi

if sed -i "/http_proxy = 1/c\\http_proxy = 0" "$APPSETTINGS"; then
    echo "Updated http_proxy in $APPSETTINGS"
fi
