#!/bin/bash
# Script Name: AtoMiC Couchpotato Reverse Proxy Enable.

if sed -i "/url_base/c\\url_base = /couchpotato" "$APPSETTINGS"; then
    echo "Updated url_base in $APPSETTINGS"
fi
