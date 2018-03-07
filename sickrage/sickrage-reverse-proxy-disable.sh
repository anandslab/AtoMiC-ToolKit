#!/bin/bash
# Script Name: AtoMiC SickRage Reverse Proxy Disable.

if sed -i "/web_root/c\\web_root = \"\"" "$APPSETTINGS"; then
    echo "Updated web_root in $APPSETTINGS"
fi

if sed -i "/handle_reverse_proxy = 1/c\\handle_reverse_proxy = 0" "$APPSETTINGS"; then
    echo "Updated handle_reverse_proxy in $APPSETTINGS"
fi
