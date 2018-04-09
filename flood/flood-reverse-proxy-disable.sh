#!/bin/bash
# Script Name: AtoMiC SickRage Reverse Proxy Disable.

if grep -q "baseURI: '/flood'," "$APPSETTINGS"; then
    ReplaceString "baseURI: '/flood'," "baseURI: '/'," "$APPSETTINGS"
    source "$SCRIPTPATH/inc/app-install-build-npm.sh"
fi
