#!/bin/bash

# Script Name: AtoMiC Rclone Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)


SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Rclone" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Install Rclone" \
"Configure" "Setup Rclone" \
"Uninstall" "Uninstall Rclone" \
"Manual Update" "Manually update Rclone" \
"Backup" "Backup Rclone settings" \
"Restore" "Restore Rclone settings from a previous backup" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/rclone/rclone-constants.sh"
    case "$SUBCHOICE" in
        "Install" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-installer.sh" ;;
        "Configure" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-configure-config.sh" ;;
        "Uninstall" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-uninstaller.sh" ;;
        "Manual Update" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-update.sh" ;;
        "Backup" ) source "$SCRIPTPATH/inc/app-backup-controller.sh" ;;
        "Restore" ) source "$SCRIPTPATH/inc/app-restore-controller.sh" ;;
        "Go Back" ) source "$SCRIPTPATH/menus/menu-sync-tools.sh" ;;
        *) source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 0
fi
