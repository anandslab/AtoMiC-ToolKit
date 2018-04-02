#!/bin/bash
# Script Name: AtoMiC Aria2 Download

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/aria2/aria2-constants.sh"
echo -e "${YELLOW}--->Aria2 Version Check...$ENDCOLOR"

source "$SCRIPTPATH/inc/app-git-latest-release-version.sh"
echo -e "Available Version: ${GREEN}$AVAILABLEVERSION$ENDCOLOR"

INSTALLEDVERSION=$(dpkg -s aria2 | grep Version | grep -oP '(?<= 1:).*(?=-1)')
echo -e "Installed Version: ${GREEN}$INSTALLEDVERSION$ENDCOLOR"

vercomp "$INSTALLEDVERSION" "$AVAILABLEVERSION"
if [[ $? != 2 ]]; then
    echo "Update not required"
    exit 1
else
    echo "Update Required"
fi
