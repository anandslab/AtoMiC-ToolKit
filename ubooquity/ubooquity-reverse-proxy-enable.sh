#!/bin/bash
# Script Name: AtoMiC Ubooquity Reverse Proxy Enable.

if sed -i "/reverseProxyPrefix/c\\  \"reverseProxyPrefix\" : \"ubooquity\"," "$APPSETTINGS"; then
    echo "Updated reverseProxyPrefix in $APPSETTINGS"
fi
