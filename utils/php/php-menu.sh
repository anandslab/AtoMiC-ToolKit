#!/bin/bash

SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage PHP 7 Latest Supported" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install/Update" "PHP 7.x via repository" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/php/php-constants.sh"
    case "$SUBCHOICE" in
        "Install/Update" )
            source "$SCRIPTPATH/utils/php/php-installer.sh" ;;
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
