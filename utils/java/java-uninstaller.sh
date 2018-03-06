#!/bin/bash

# Script Name: AtoMiC Java Uninstaller
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo -e "${GREEN}AtoMiC $APPTITLE Uninstaller Script$ENDCOLOR"

source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-uninstall-deps.sh"
source "$SCRIPTPATH/utils/java/java-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-remove.sh"
source "$SCRIPTPATH/inc/app-uninstall-confirmation.sh"
