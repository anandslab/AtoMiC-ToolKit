#!/bin/bash
# Script Name: AtoMiC Jackett Version Check

echo
source "$SCRIPTPATH/inc/commons.sh"
echo -e "${YELLOW}--->Jackett Version Check...$ENDCOLOR"
JACKETTVERSION=$(curl -s https://github.com/Jackett/Jackett/releases/latest  | \
grep -o '".*"' | \
awk -F / '{print $NF}' | \
sed s'/[v"]//g')
echo "Available Version: $JACKETTVERSION"

if ! checkappversion "JACKETT" "$JACKETTVERSION" ; then
    exit 1
fi
