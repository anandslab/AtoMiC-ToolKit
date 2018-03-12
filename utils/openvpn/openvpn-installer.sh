#!/bin/bash
# Script Name: AtoMiC OpenVPN Installer

echo
source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/utils/openvpn/openvpn-constants.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/utils/openvpn/openvpn-repository-configurator.sh"
source "$SCRIPTPATH/inc/app-repository-add.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-install.sh"
echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
