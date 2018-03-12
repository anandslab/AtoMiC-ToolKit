#!/bin/bash
# Script Name: AtoMiC Mono Uninstaller

echo -e "${GREEN}AtoMiC $APPTITLE Uninstaller Script$ENDCOLOR"

source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-uninstall.sh"
source "$SCRIPTPATH/inc/app-uninstall-deps.sh"
source "$SCRIPTPATH/utils/mono/mono-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-remove.sh"
source "$SCRIPTPATH/inc/app-uninstall-confirmation.sh"
