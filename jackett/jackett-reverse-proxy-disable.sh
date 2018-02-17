#!/bin/bash
# Script Name: AtoMiC Jackett Reverse Proxy Disable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i "/BasePathOverride/c\\\"BasePathOverride\": null," "$APPSETTINGS"; then
    echo "Updated BasePathOverride in $APPSETTINGS"
fi
