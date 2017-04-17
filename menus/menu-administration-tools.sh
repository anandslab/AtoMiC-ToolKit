#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Admin Tools Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" \
--menu "Which app would you like to manage?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"HTPC Manager" "Unified HTPC Web Interface" \
"Muximux" "A lightweight way to manage your HTPC" \
"Ombi" "Allow your users to Request Movies, TV Shows and Albums" \
"Webmin" "Web-based system administration" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    case "$SUBCHOICE" in
        "HTPC Manager" )
            source "$SCRIPTPATH/htpcmanager/htpcmanager-menu.sh" ;;
        "Muximux" )
            source "$SCRIPTPATH/muximux/muximux-menu.sh" ;;
        "Ombi" )
            source "$SCRIPTPATH/ombi/ombi-menu.sh" ;;
        "Webmin" )
            source "$SCRIPTPATH/webmin/webmin-menu.sh" ;;
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
