#!/bin/bash
# Script Name: AtoMiC Tautulli Menu

SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Tautulli" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Install Tautulli (upgrades PlexPy if found)" \
"Uninstall" "Uninstall Tautulli" \
"Backup" "Backup Tautulli settings" \
"Restore" "Restore Tautulli settings from a previous backup" \
"Manual Update" "Manually update Tautulli" \
"Enable Reverse Proxy" "Allow access" \
"Disable Reverse Proxy" "Remove access" \
"Access Details" "View Tautulli access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/tautulli/tautulli-constants.sh"
    case "$SUBCHOICE" in
        "Install" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-installer.sh" ;;
        "Uninstall" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-uninstaller.sh" ;;
        "Backup" ) source "$SCRIPTPATH/inc/app-backup-controller.sh" ;;
        "Restore" ) source "$SCRIPTPATH/inc/app-restore-controller.sh" ;;
        "Manual Update" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-update.sh" ;;
        "Enable Reverse Proxy" ) source "$SCRIPTPATH/utils/nginx/nginx-enable-location.sh" ;;
        "Disable Reverse Proxy" ) source "$SCRIPTPATH/utils/nginx/nginx-disable-location.sh" ;;
        "Access Details" ) source "$SCRIPTPATH/inc/app-access-details.sh" ;;
        "Go Back" )
            source "$SCRIPTPATH/menus/menu-personal-media-servers.sh" ;;
        *) source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 0
fi
