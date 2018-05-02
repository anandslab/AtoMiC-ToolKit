#!/bin/bash
# Script Name: AtoMiC Nginx Installer

echo
echo -e "${GREEN}AtoMiC Nginx Installer Script$ENDCOLOR"
source "$SCRIPTPATH/utils/php/php-installer.sh"
source "$SCRIPTPATH/utils/nginx/nginx-constants.sh"
source "$SCRIPTPATH/utils/nginx/nginx-disable-apache2.sh"
source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/utils/nginx/nginx-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-remove.sh"
source "$SCRIPTPATH/inc/app-repository-add.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-install.sh"
source "$SCRIPTPATH/utils/nginx/nginx-configurator.sh"
echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
