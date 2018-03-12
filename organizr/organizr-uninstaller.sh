#!/bin/bash
# Script Name: AtoMiC Organizr Uninstaller

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Uninstaller Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/organizr/organizr-constants.sh"
source "$SCRIPTPATH/inc/app-file-del.sh"
source "$SCRIPTPATH/utils/nginx/nginx-disable-location.sh" 'SKIP'
source "$SCRIPTPATH/inc/app-uninstall-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
