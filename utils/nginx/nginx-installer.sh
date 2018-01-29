#!/bin/bash
# shellcheck disable=SC1090
# shellcheck disable=SC2034
# Script Name: AtoMiC Nginx Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "${GREEN}AtoMiC Nginx Installer Script$ENDCOLOR"
source "$SCRIPTPATH/utils/nginx/nginx-disable-apache2.sh"
source "$SCRIPTPATH/utils/php/php-installer.sh"
source "$SCRIPTPATH/utils/nginx/nginx-constants.sh"
source "$SCRIPTPATH/inc/app-stop.sh"
source "$SCRIPTPATH/utils/nginx/nginx-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-remove.sh"
source "$SCRIPTPATH/inc/app-repository-add.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-install.sh"
source "$SCRIPTPATH/inc/app-folders-create.sh"
source "$SCRIPTPATH/utils/nginx/nginx-enable-locations.sh"
source "$SCRIPTPATH/utils/nginx/nginx-site-configurator.sh"
echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
