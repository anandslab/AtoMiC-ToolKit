#!/bin/bash
# Script Name: AtoMiC Ombi Downloader

echo
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/ombi/ombi-constants.sh"
echo -e "${YELLOW}--->Ombi Version Check...$ENDCOLOR"
CONTENT=$(echo 'select Content from globalsettings;' | sqlite3 "$APPSETTINGSDB")
OMBIAPIKEY=$(grep -Po '(?<="ApiKey":")([^"]+)' <<<  "$CONTENT")

if [[ -n $OMBIAPIKEY ]]; then
    OMBIJSON=$(curl -sL --header "ApiKey: $OMBIAPIKEY" localhost:5000/api/v1/Settings/about)
    OMBIINSTALLEDVERSION=$(grep -Po '(?<="version":")([^"]+)' <<<  "$OMBIJSON")
    echo -e "Installed Version: ${GREEN}$OMBIINSTALLEDVERSION$ENDCOLOR"
else
    echo -e "${YELLOW}ERROR: unable to retrieve APIKEY. Is it set in the Ombi settings?$ENDCOLOR"
    echo "Updating continuing however possibly not necessary"
fi

source "$SCRIPTPATH/inc/app-git-latest-release-version.sh"
echo -e "Available Version: ${GREEN}$AVAILABLEVERSION$ENDCOLOR"

vercomp "$OMBIINSTALLEDVERSION" "$AVAILABLEVERSION"
if [[ $? != 2 ]]; then
    echo "Update not required"
    exit 1
else
    echo "Update Required"
fi
