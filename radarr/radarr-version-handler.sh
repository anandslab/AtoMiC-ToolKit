#!/bin/bash
# Script Name: AtoMiC Radarr Version Check

echo
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/radarr/radarr-constants.sh"
echo -e "${YELLOW}--->Radarr Version Check...$ENDCOLOR"
source "$SCRIPTPATH/inc/app-git-latest-release-version.sh"
echo -e "Available Version: ${GREEN}$AVAILABLEVERSION$ENDCOLOR"

if ! checkappversion "RADARR" "$AVAILABLEVERSION" ; then
    exit 1
fi
