#!/bin/bash
# Script Name: AtoMiC Nginx Uninstaller

echo -e "${GREEN}AtoMiC $APPTITLE Uninstaller Script$ENDCOLOR"

source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/inc/app-uninstall.sh"
source "$SCRIPTPATH/inc/app-uninstall-deps.sh"
source "$SCRIPTPATH/utils/nginx/nginx-config-remove.sh"
source "$SCRIPTPATH/utils/nginx/nginx-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-remove.sh"
source "$SCRIPTPATH/inc/app-uninstall-confirmation.sh"
