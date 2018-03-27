#!/bin/bash
# Script Name: AtoMiC FileBot Menu

SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage FileBot" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Install Latest FileBot" \
"Uninstall" "Uninstall FileBot" \
"Manual Update" "Update FileBot" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/filebot/filebot-constants.sh"
    case "$SUBCHOICE" in
        "Install" ) source "$SCRIPTPATH/utils/$APPNAME/$APPNAME-installer.sh" ;;
        "Uninstall" ) source "$SCRIPTPATH/utils/$APPNAME/$APPNAME-uninstaller.sh" ;;
        "Manual Update" ) source "$SCRIPTPATH/utils/$APPNAME/$APPNAME-update.sh" ;;
        "Go Back" ) source "$SCRIPTPATH/utils/utils-menu.sh" ;;
        *) source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 0
fi
