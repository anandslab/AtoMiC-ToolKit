#!/bin/bash
# Script Name: AtoMiC PVRS Menu

SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" \
--menu "Which app would you like to manage?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Aria2" "Lightweight multi-protocol & multi-source cmd download utility" \
"Aria2-Webui" "Web interface to interact with aria2" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    case "$SUBCHOICE" in
        "Aria2" )
            source "$SCRIPTPATH/aria2/aria2-menu.sh" ;;
        "Aria2-Webui" )
            source "$SCRIPTPATH/aria2-webui/aria2-webui-menu.sh" ;;
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
