#!/bin/bash
# Script Name: AtoMiC Couchpotato Reverse Proxy Disable.

if sed -i "/url_base/c\\url_base = " "$APPSETTINGS"; then
    echo "Updated url_base in $APPSETTINGS"
fi
