#!/bin/bash

SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Node.js Latest Supported" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Node.js repository" \
"Update" "Node.js package" \
"Uninstall" "Node.js and repository" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/nodejs/nodejs-constants.sh"
    case "$SUBCHOICE" in
        "Install" )
            source "$SCRIPTPATH/utils/$APPNAME/$APPNAME-installer.sh" ;;
        "Update" )
            source "$SCRIPTPATH/utils/$APPNAME/$APPNAME-update.sh" ;;
        "Uninstall" )
            source "$SCRIPTPATH/utils/nodejs/nodejs-uninstaller.sh" ;;
        "Go Back" )
            source "$SCRIPTPATH/utils/utils-menu.sh" ;;
        *)
            source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 1
fi
