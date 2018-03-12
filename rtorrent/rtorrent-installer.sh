#!/bin/bash
# Script Name: AtoMiC rTorrent Installer

source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/rtorrent/rtorrent-constants.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-install-deps.sh"
source "$SCRIPTPATH/inc/app-install.sh"
source "$SCRIPTPATH/inc/app-folders-create.sh"
source "$SCRIPTPATH/inc/app-autostart-configure.sh"
source "$SCRIPTPATH/rtorrent/rtorrent-settings-configurator.sh"
source "$SCRIPTPATH/inc/app-start.sh"
echo -e "${GREEN}---> $APPTITLE installation complete.$ENDCOLOR"
source "$SCRIPTPATH/inc/app-constant-reset.sh"
