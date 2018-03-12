#!/bin/bash
# Script Name: AtoMiC Rclone Installer

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"
source "$SCRIPTPATH/inc/pause.sh"
curl https://rclone.org/install.sh | sudo bash
source "$SCRIPTPATH/inc/app-folders-create.sh"
source "$SCRIPTPATH/inc/app-set-permissions.sh"
if [[ -z $CI ]]; then
    rclone config
fi
source "$SCRIPTPATH/inc/app-install-confirmation.sh"
source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
