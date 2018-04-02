#!/bin/bash
# Script Name: AtoMiC Aria2 Menu

SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Aria2" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Install Aria2" \
"Uninstall" "Uninstall Aria2" \
"Manual Update" "Manually update Aria2" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/aria2/aria2-constants.sh"
    case "$SUBCHOICE" in
        "Install" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-installer.sh" ;;
        "Uninstall" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-uninstaller.sh" ;;
        "Manual Update" ) source "$SCRIPTPATH/$APPNAME/$APPNAME-update.sh" ;;
        "Go Back" ) source "$SCRIPTPATH/menus/menu-download-managers.sh" ;;
        *) source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
    source "$SCRIPTPATH/inc/thankyou.sh"
    source "$SCRIPTPATH/inc/exit.sh"
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 0
fi
