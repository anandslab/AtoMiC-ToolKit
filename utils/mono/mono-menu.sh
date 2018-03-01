#!/bin/bash

source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Mono" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Mono via repository" \
"Uninstall" "Mono and remove repository" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/mono/mono-constants.sh"
    case "$SUBCHOICE" in
        "Install" ) source "$SCRIPTPATH/utils/mono/mono-installer.sh" ;;
        "Uninstall" ) source "$SCRIPTPATH/utils/mono/mono-uninstaller.sh" ;;
        "Go Back" ) source "$SCRIPTPATH/utils/utils-menu.sh" ;;
        *) source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 1
fi
