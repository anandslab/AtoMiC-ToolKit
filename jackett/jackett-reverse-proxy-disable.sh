#!/bin/bash
# Script Name: AtoMiC Jackett Reverse Proxy Disable.

if sed -i "/BasePathOverride/c\\\"BasePathOverride\": null," "$APPSETTINGS"; then
    echo "Updated BasePathOverride in $APPSETTINGS"
fi
