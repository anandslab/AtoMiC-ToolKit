#!/bin/bash
# shellcheck disable=SC1090
source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Nginx" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install\Update" "Nginx high-performance HTTP server and reverse proxy" \
"Uninstall" "Nginx" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/nginx/nginx-constants.sh"
    case "$SUBCHOICE" in
        "Install\Update" )
            source "$SCRIPTPATH/utils/nginx/nginx-installer.sh" ;;
        "Uninstall" )
            source "$SCRIPTPATH/utils/nginx/nginx-uninstaller.sh" ;;
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
