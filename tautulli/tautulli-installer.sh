#!/bin/bash
# Script Name: AtoMiC Tautulli Installer

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-move-previous.sh"
source "$SCRIPTPATH/inc/pkgupdate.sh"
source "$SCRIPTPATH/inc/app-git-download.sh"
source "$SCRIPTPATH/inc/app-autostart-configure.sh"

if [[ ! -f "$APPSETTINGS" ]]; then
    sudo cp "$SCRIPTPATH/tautulli/tautulli-config.ini" "$APPSETTINGS" || \
    { echo -e "${RED}Conf file not copied.$ENDCOLOR" ; exit 1; }
fi

source "$SCRIPTPATH/tautulli/plexpy-uninstaller.sh"
source "$SCRIPTPATH/tautulli/tautulli-constants.sh"
source "$SCRIPTPATH/inc/app-set-permissions.sh"
source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
