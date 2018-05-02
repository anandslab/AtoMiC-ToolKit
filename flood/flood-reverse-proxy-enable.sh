#!/bin/bash
# Script Name: AtoMiC SickRage Reverse Proxy Enable.

if ! grep -q "baseURI: '/flood'," "$APPSETTINGS"; then
    ReplaceString "baseURI: '/'," "baseURI: '/flood'," "$APPSETTINGS"
    source "$SCRIPTPATH/inc/app-install-build-npm.sh"
fi
