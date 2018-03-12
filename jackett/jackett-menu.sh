#!/bin/bash
# Script Name: AtoMiC Jackett Menu

SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Jackett" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Install Jackett" \
"Uninstall" "Uninstall Jackett" \
"Backup" "Backup Jackett settings" \
"Restore" "Restore Jackett settings from a previous backup" \
"Manual Update" "Manually update Jackett" \
"Enable Reverse Proxy" "Allow access" \
"Disable Reverse Proxy" "Remove access" \
"Access Details" "View Jackett access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/jackett/jackett-constants.sh"
    case "$SUBCHOICE" in
        "Install" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-installer.sh" ;;
        "Uninstall" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-uninstaller.sh" ;;
        "Backup" ) source "$SCRIPTPATH/inc/app-backup-controller.sh" ;;
        "Restore" ) source "$SCRIPTPATH/inc/app-restore-controller.sh" ;;
        "Manual Update" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-update.sh" ;;
        "Enable Reverse Proxy" ) source "$SCRIPTPATH/utils/nginx/nginx-enable-location.sh" ;;
        "Disable Reverse Proxy" ) source "$SCRIPTPATH/utils/nginx/nginx-disable-location.sh" ;;
        "Access Details" ) source "$SCRIPTPATH/inc/app-access-details.sh" ;;
        "Go Back" ) source "$SCRIPTPATH/menus/menu-bittorrent.sh" ;;
        *) source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 0
fi
