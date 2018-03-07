#!/bin/bash
# Script Name: AtoMiC Grafana Reverse Proxy Disable.

if sed -i "/root_url/c\\;root_url = http://localhost:3000" "$APPSETTINGS"; then
    echo "Updated root_url in $APPSETTINGS"
fi
