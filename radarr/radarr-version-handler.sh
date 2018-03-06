#!/bin/bash
# Script Name: AtoMiC Radarr Version Check
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
source "$SCRIPTPATH/inc/commons.sh"
echo -e "${YELLOW}--->Radarr Version Check...$ENDCOLOR"
RADARRVERSION=$(curl -s https://api.github.com/repos/radarr/radarr/releases | \
    grep browser_download_url | \
    grep linux.tar.gz | \
    head -n 1 | \
    cut -d '"' -f 4 |
    cut -d/ -f8 |
    sed s'/[v"]//g')
echo "Available Version: $RADARRVERSION"

if ! checkappversion "RADARR" "$RADARRVERSION" ; then
    exit 1
fi
