#!/bin/bash
# Script Name: AtoMiC Jackett Reverse Proxy Enable.

if sed -i "/BasePathOverride/c\\\"BasePathOverride\": \"/jackett\"," "$APPSETTINGS"; then
    echo "Updated BasePathOverride in $APPSETTINGS"
fi
