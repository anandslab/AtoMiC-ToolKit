#!/bin/bash
# Script Name: AtoMiC Ubooquity Version Check

echo
source "$SCRIPTPATH/inc/commons.sh"
echo -e "${YELLOW}--->Ubooquity Version Check...$ENDCOLOR"
RADARRVERSION=$(curl -s https://vaemendis.net/ubooquity/static2/download | \
    grep -oP '(?<=Version ).*(?=&nbsp)')
echo "Available Version: $RADARRVERSION"

if ! checkappversion "UBOOQUITY" "$RADARRVERSION" ; then
    exit 1
fi
