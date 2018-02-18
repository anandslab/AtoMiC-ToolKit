#!/bin/bash
# Script Name: AtoMiC Grafana Reverse Proxy Disable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i "/root_url/c\\;root_url = http://localhost:3000" "$APPSETTINGS"; then
    echo "Updated root_url in $APPSETTINGS"
fi
