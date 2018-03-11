#!/bin/bash
SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Duck DNS" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Duck DNS Cron Job updater" \
"Uninstall" "Duck DNS Cron Job" \
"Manual Update" "Run Duck DNS Cron Job" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/duckdns/duckdns-constants.sh"
    case "$SUBCHOICE" in
        "Install" )
            source "$SCRIPTPATH/utils/duckdns/duckdns-cron-create.sh" ;;
        "Uninstall" )
            source "$SCRIPTPATH/utils/duckdns/duckdns-cron-remove.sh" ;;
        "Manual Update" )
            source "$SCRIPTPATH/utils/duckdns/duckdns-cron-run.sh" ;;
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
