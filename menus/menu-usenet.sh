#!/bin/bash

# Script Name: AtoMiC Usenet Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)



SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" \
--menu "Which app would you like to manage?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"NZBGet" "NZB Newsgrabber / Downloader" \
"NZBHydra" "Meta search for NZB indexers" \
"SABnzbd+" "NZB Newsgrabber / Downloader" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    case "$SUBCHOICE" in
        "NZBGet" )
            source "$SCRIPTPATH/nzbget/nzbget-menu.sh" ;;
        "NZBHydra" )
            source "$SCRIPTPATH/nzbhydra/nzbhydra-menu.sh" ;;
        "SABnzbd+" )
            source "$SCRIPTPATH/sabnzbdplus/sabnzbdplus-menu.sh" ;;
        "Go Back" )
            source "$SCRIPTPATH/menus/menu-main.sh" ;;
        *)
            source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 0
fi
