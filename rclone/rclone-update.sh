#!/bin/bash
# Script Name: AtoMiC Rclone Update

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Update Script$ENDCOLOR"
if DoesAppFolderExist; then
    source "$SCRIPTPATH/inc/pause.sh"
    curl https://rclone.org/install.sh | sudo bash
    source "$SCRIPTPATH/inc/app-install-confirmation.sh"
    source "$SCRIPTPATH/inc/thankyou.sh"
fi
source "$SCRIPTPATH/inc/exit.sh"
