#!/bin/bash
# Script Name: AtoMiC Jackett Version Check

echo
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/jackett/jackett-constants.sh"

echo -e "${YELLOW}--->Jackett Version Check...$ENDCOLOR"
source "$SCRIPTPATH/inc/app-git-latest-release-version.sh"
echo "Available Version: $AVAILABLEVERSION"

if ! checkappversion "JACKETT" "$AVAILABLEVERSION" ; then
    exit 1
fi
