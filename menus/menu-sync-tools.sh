#!/bin/bash
# Script Name: AtoMiC Synchronization Tools Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" \
--menu "Which app would you like to manage?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Rclone" "Command line program to sync files and directories" \
"Rclone Browser" "Simple GUI for rclone command line tool" \
"Resilio-Sync" "Fast and reliable file and folder synchronization" \
"Syncthing" "Open Source Continuous File Synchronization" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    case "$SUBCHOICE" in
        "Rclone" )
            source "$SCRIPTPATH/rclone/rclone-menu.sh" ;;
        "Rclone Browser" )
            source "$SCRIPTPATH/rclone-browser/rclone-browser-menu.sh" ;;
        "Resilio-Sync" )
            source "$SCRIPTPATH/resilio-sync/resilio-sync-menu.sh" ;;
        "Syncthing" )
            source "$SCRIPTPATH/syncthing/syncthing-menu.sh" ;;
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
