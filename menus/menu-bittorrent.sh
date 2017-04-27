#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC BitTorrent Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" \
--menu "Which app would you like to manage?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Deluge" "Lightweight, Full-featured BitTorrent client" \
"Jackett" "API Support for your favorite private trackers" \
"qBittorrent" "An open-source software alternative to µTorrent" \
"Resilio-Sync" "Fast and reliable file and folder synchronization" \
"rTorrent" "Command line bittorrent client" \
"ruTorrent" "Web front-end for rTorrent" \
"Transmission" "Fast, easy, and free BitTorrent client" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    case "$SUBCHOICE" in
        "Deluge" )
            source "$SCRIPTPATH/deluged/deluged-menu.sh" ;;
        "Jackett" )
            source "$SCRIPTPATH/jackett/jackett-menu.sh" ;;
        "qBittorrent" )
            source "$SCRIPTPATH/qbittorrent-nox/qbittorrent-nox-menu.sh" ;;
        "Resilio-Sync" )
            source "$SCRIPTPATH/resilio-sync/resilio-sync-menu.sh" ;;
        "rTorrent" )
            source "$SCRIPTPATH/rtorrent/rtorrent-menu.sh" ;;
        "ruTorrent" )
            source "$SCRIPTPATH/rutorrent/rutorrent-menu.sh" ;;
        "Transmission" )
        source "$SCRIPTPATH/transmission-daemon/transmission-daemon-menu.sh" ;;
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
