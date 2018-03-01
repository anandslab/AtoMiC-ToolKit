#!/bin/bash

source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage nzbTomedia" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install/Update" "nzbTomedia Scripts" \
"Uninstall" "nzbTomedia Scripts" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-constants.sh"
    case "$SUBCHOICE" in
        "Install/Update" )
            source "$SCRIPTPATH/utils/$APPNAME/$APPNAME-installer.sh" ;;
        "Uninstall" )
            source "$SCRIPTPATH/utils/$APPNAME/$APPNAME-uninstaller.sh" ;;
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
