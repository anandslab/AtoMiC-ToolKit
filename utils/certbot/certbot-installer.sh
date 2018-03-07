#!/bin/bash
# Script Name: AtoMiC Certbot Installer

echo
echo -e "${GREEN}AtoMiC Certbot Installer Script$ENDCOLOR"
source "$SCRIPTPATH/utils/python/python-installer.sh"
source "$SCRIPTPATH/utils/certbot/certbot-constants.sh"
source "$SCRIPTPATH/utils/certbot/certbot-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-add.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-install.sh"
certbot
echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
