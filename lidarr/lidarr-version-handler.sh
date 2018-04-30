#!/bin/bash
# Script Name: AtoMiC Lidarr Version Check

echo
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/lidarr/lidarr-constants.sh"
echo -e "${YELLOW}--->Lidarr Version Check...$ENDCOLOR"
source "$SCRIPTPATH/inc/app-git-latest-release-version.sh"
echo -e "Available Version: ${GREEN}$AVAILABLEVERSION$ENDCOLOR"

if ! checkappversion "LIDARR" "$AVAILABLEVERSION" ; then
    exit 1
fi
