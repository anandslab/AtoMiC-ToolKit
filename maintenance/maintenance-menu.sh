#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Maintenance Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Maintenance" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Clear Temp Files" "Clear disclaimer consent and user info" \
"Delete Backups" "Delete app backups" \
"Update ToolKit" "Update AtoMiC ToolKit" \
"Update Linux" "Update Distro Packages" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    case "$SUBCHOICE" in
        "Clear Temp Files" ) source "$SCRIPTPATH/maintenance/cleartmp.sh" ;;
        "Delete Backups" ) source "$SCRIPTPATH/maintenance/clearbackups.sh" ;;
        "Update ToolKit" ) source "$SCRIPTPATH/maintenance/update.sh" ;;
        "Update Linux" ) source "$SCRIPTPATH/maintenance/distro-update.sh" ;;
        "Go Back" ) source "$SCRIPTPATH/menus/menu-main.sh" ;;
        *) source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 0
fi
