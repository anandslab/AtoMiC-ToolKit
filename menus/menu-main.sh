#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Main Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)


source "$SCRIPTPATH/inc/app-setup-check.sh"
MAINCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" \
--menu "Which app would you like to manage?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"PVRs" "Automatic Media Library Manager" \
"Usenet Downloaders" "Download binary files from Usenet servers" \
"Bittorrent Clients" "Download Torrents" \
"Personal Media Servers" "Organise and serve Media" \
"Home Theater" "Media Playback" \
"Sync Tools" "Keep files and folders synchronized" \
"Administration Tools" "system configuration tools e.g. Webmin" \
"Utilities" "Other miscellaneous tools" \
"Maintenance" "Perform maintenance tasks" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    case "$MAINCHOICE" in
        "PVRs" )
            source "$SCRIPTPATH/menus/menu-pvrs.sh" ;;
        "Usenet Downloaders" )
            source "$SCRIPTPATH/menus/menu-usenet.sh" ;;
        "Bittorrent Clients" )
            source "$SCRIPTPATH/menus/menu-bittorrent.sh" ;;
        "Personal Media Servers" )
            source "$SCRIPTPATH/menus/menu-personal-media-servers.sh" ;;
        "Home Theater" )
            source "$SCRIPTPATH/menus/menu-home-theater.sh" ;;
        "Sync Tools" )
            source "$SCRIPTPATH/menus/menu-sync-tools.sh" ;;
        "Administration Tools" )
            source "$SCRIPTPATH/menus/menu-administration-tools.sh" ;;
        "Utilities" )
            source "$SCRIPTPATH/utils/utils-menu.sh" ;;
        "Maintenance" )
            source "$SCRIPTPATH/maintenance/maintenance-menu.sh" ;;
        *)
            echo -e "${RED}Invalid Option$ENDCOLOR"
            source "$SCRIPTPATH/inc/exit.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 0
fi
