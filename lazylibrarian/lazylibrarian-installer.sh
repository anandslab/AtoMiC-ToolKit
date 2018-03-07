#!/bin/bash
# Script Name: AtoMiC Lazy Librarian Installer

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-autostart-remove.sh"
source "$SCRIPTPATH/inc/app-move-previous.sh"
source "$SCRIPTPATH/utils/python/python-installer.sh"
source "$SCRIPTPATH/lazylibrarian/lazylibrarian-constants.sh"
source "$SCRIPTPATH/inc/app-git-download.sh"

#Now uses all 3 boot files regardless
source "$SCRIPTPATH/inc/app-default-copy.sh"
source "$SCRIPTPATH/$APPNAME/$APPNAME-default-update.sh"
source "$SCRIPTPATH/inc/app-init-add.sh"
if IsSystemdSupported; then
    source "$SCRIPTPATH/inc/app-systemd-add.sh"
fi

source "$SCRIPTPATH/inc/app-start.sh"
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
