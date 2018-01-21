#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Kodi Remove Launch on boot
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-setup-check.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Remove Launch on boot Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/pause.sh"
