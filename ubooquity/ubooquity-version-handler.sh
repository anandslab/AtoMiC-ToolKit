#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Ubooquity Version Check
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
source "$SCRIPTPATH/inc/commons.sh"
echo -e "${YELLOW}--->Ubooquity Version Check...$ENDCOLOR"
RADARRVERSION=$(curl -s https://vaemendis.net/ubooquity/static2/download | \
    grep -oP '(?<=Version ).*(?=&nbsp)')
echo "Available Version: $RADARRVERSION"

if ! checkappversion "UBOOQUITY" "$RADARRVERSION" ; then
    exit 1
fi
