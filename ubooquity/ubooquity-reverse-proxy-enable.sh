#!/bin/bash
# Script Name: AtoMiC Ubooquity Reverse Proxy Enable.
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

if sed -i "/reverseProxyPrefix/c\\  \"reverseProxyPrefix\" : \"ubooquity\"," "$APPSETTINGS"; then
    echo "Updated reverseProxyPrefix in $APPSETTINGS"
fi
