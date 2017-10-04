#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Nginx Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo
echo -e "${GREEN}AtoMiC Nginx Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
APPNAME='apache2'
APPTITLE='apache2'
APPSYSTEMD='apache2.service'
APPINITD='apache2'
source "$SCRIPTPATH/inc/app-autostart-disable.sh"
source "$SCRIPTPATH/utils/php/php-installer.sh"
source "$SCRIPTPATH/utils/nginx/nginx-constants.sh"
source "$SCRIPTPATH/utils/nginx/nginx-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-add.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-install.sh"
source "$SCRIPTPATH/utils/nginx/nginx-site-configurator.sh"
echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
