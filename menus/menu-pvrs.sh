#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC PVRS Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" \
--menu "Which app would you like to manage?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"CouchPotato" "Movies PVR Client" \
"Headphones" "Music PVR Client" \
"Lazy Librarian" "Book PVR Client" \
"Mylar" "Comics PVR Client" \
"Radarr" "Works with movies à la Couchpotato." \
"SickGear" "TV Shows PVR Client" \
"SickRage" "Automatic Video Library Manager for TV Shows." \
"Sonarr" "Smart TV show PVR for newsgroup and bittorrent users." \
"Watcher" "Automated movie NZB searcher and snatcher" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    case "$SUBCHOICE" in
        "CouchPotato" )
            source "$SCRIPTPATH/couchpotato/couchpotato-menu.sh" ;;
        "Headphones" )
            source "$SCRIPTPATH/headphones/headphones-menu.sh" ;;
        "Lazy Librarian" )
            source "$SCRIPTPATH/lazylibrarian/lazylibrarian-menu.sh" ;;
        "Mylar" )
            source "$SCRIPTPATH/mylar/mylar-menu.sh" ;;
        "Radarr" )
            source "$SCRIPTPATH/radarr/radarr-menu.sh" ;;
        "SickGear" )
            source "$SCRIPTPATH/sickgear/sickgear-menu.sh" ;;
        "SickRage" )
            source "$SCRIPTPATH/sickrage/sickrage-menu.sh" ;;
        "Sonarr" )
            source "$SCRIPTPATH/sonarr/sonarr-menu.sh" ;;
        "Watcher" )
            source "$SCRIPTPATH/watcher/watcher-menu.sh" ;;
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