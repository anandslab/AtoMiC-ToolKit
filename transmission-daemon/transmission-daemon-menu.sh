#!/bin/bash
# shellcheck disable=SC1090

source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage Transmission" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Install" "Install Transmission" \
"Uninstall" "Uninstall Transmission" \
"Backup" "Backup Transmission settings" \
"Restore" "Restore Transmission settings from a previous backup" \
"Manual Update" "Manually update Transmission" \
"Reset Password" "Reset Transmission WebUI password" \
"Access Details" "View Transmission access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source "$SCRIPTPATH/transmission-daemon/transmission-daemon-constants.sh"
    case "$SUBCHOICE" in 
        "Install" ) source "$SCRIPTPATH/transmission-daemon/transmission-daemon-installer.sh" ;;
        "Uninstall" ) source "$SCRIPTPATH/transmission-daemon/transmission-daemon-uninstaller.sh" ;;
        "Backup" ) source "$SCRIPTPATH/inc/app-backup-controller.sh" ;;
        "Restore" ) source "$SCRIPTPATH/inc/app-restore-controller.sh" ;;
        "Manual Update" ) source "$SCRIPTPATH/transmission-daemon/transmission-daemon-update.sh" ;;
        "Reset Password" ) source "$SCRIPTPATH/inc/app-password-reset-controller.sh" ;;
        "Access Details" ) source "$SCRIPTPATH/inc/app-access-details.sh" ;;
        "Go Back" ) source "$SCRIPTPATH/menus/menu-bittorrent.sh" ;;
        *) source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
fi