#!/bin/bash
# shellcheck disable=SC1090
source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Node.js Latest Supported" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install\Update" "Node.js repository" \
"Uninstall" "Node.js and repository" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/nodejs/nodejs-constants.sh"
    case "$SUBCHOICE" in
        "Install\Update" )
            source "$SCRIPTPATH/utils/$APPNAME/$APPNAME-installer.sh" ;;
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
