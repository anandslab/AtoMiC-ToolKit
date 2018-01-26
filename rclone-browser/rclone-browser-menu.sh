#!/bin/bash
# shellcheck disable=SC1090
source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Rclone Browser" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Rclone Browser via repository" \
"Uninstall" "Rclone Browser and remove repository" \
"Manual Update" "Manually update Rclone Browser" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/rclone-browser/rclone-browser-constants.sh"
    case "$SUBCHOICE" in
        "Install" ) source "$SCRIPTPATH/rclone-browser/rclone-browser-installer.sh" ;;
        "Uninstall" ) source "$SCRIPTPATH/rclone-browser/rclone-browser-uninstaller.sh" ;;
        "Manual Update" ) source "$SCRIPTPATH/rclone-browser/rclone-browser-update.sh" ;;
        "Go Back" ) source "$SCRIPTPATH/utils-menu.sh" ;;
        *) source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 1
fi
