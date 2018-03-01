#!/bin/bash

# Script Name: AtoMiC Private Internet Access Client Uninstaller
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo -e "${GREEN}AtoMiC $APPTITLE Uninstaller Script$ENDCOLOR"
source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/utils/pia/pia-client-kill.sh"
source "$SCRIPTPATH/inc/app-file-del.sh"
source "$SCRIPTPATH/inc/app-uninstall-confirmation.sh"
