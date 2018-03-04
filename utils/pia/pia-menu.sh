#!/bin/bash


SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Private Internet Access" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install\\Update Client" "Install DESKTOP ONLY client" \
"Uninstall" "Remove DESKTOP ONLY client" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/pia/pia-constants.sh"
    case "$SUBCHOICE" in
        "Install\\Update Client" )
            source "$SCRIPTPATH/utils/pia/pia-client-installer.sh" ;;
        "Uninstall" )
            source "$SCRIPTPATH/utils/pia/pia-client-uninstaller.sh" ;;
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
