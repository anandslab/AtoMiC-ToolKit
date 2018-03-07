#!/bin/bash
# Script Name: AtoMiC Ubooquity Reverse Proxy Disable.

if sed -i "/reverseProxyPrefix/c\\  \"reverseProxyPrefix\" : \"\"," "$APPSETTINGS"; then
    echo "Updated reverseProxyPrefix in $APPSETTINGS"
fi
