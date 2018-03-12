#!/bin/bash
# Script Name: AtoMiC Nginx Updater

echo
echo -e "${GREEN}AtoMiC Nginx Installer Script$ENDCOLOR"
source "$SCRIPTPATH/utils/php/php-installer.sh"
source "$SCRIPTPATH/utils/nginx/nginx-constants.sh"
source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-update.sh"
source "$SCRIPTPATH/utils/nginx/nginx-configurator.sh"
echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
