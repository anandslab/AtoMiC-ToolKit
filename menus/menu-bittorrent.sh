#!/bin/bash
# Script Name: AtoMiC BitTorrent Menu

SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" \
--menu "Which app would you like to manage?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Deluge" "Lightweight, Full-featured BitTorrent client" \
"Flood" "A modern web UI for rTorrent" \
"Jackett" "API Support for your favorite private trackers" \
"qBittorrent" "An open-source software alternative to µTorrent" \
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
        "Flood" )
            source "$SCRIPTPATH/flood/flood-menu.sh" ;;
        "Jackett" )
            source "$SCRIPTPATH/jackett/jackett-menu.sh" ;;
        "qBittorrent" )
            source "$SCRIPTPATH/qbittorrent-nox/qbittorrent-nox-menu.sh" ;;
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
