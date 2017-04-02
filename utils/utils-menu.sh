#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC Utils Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Other Tools" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"FFmpeg" "Record, convert and stream audio and video" \
"Mono" "Open source implementation of MS .NET Framework" \
"nzbToMedia" "Provides NZB and Torrent postprocessing" \
"Unrar" "Install latest Unrar from RARLAB source" \
"pyLoad" "Download manager, lightweight and remotely manageable" \
"Install Bash Aliases" "Allows shortening commands" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    case "$SUBCHOICE" in
        "FFmpeg" )
            source "$SCRIPTPATH/utils/ffmpeg/ffmpeg-menu.sh" ;;
        "Mono" )
            source "$SCRIPTPATH/utils/mono/mono-menu.sh" ;;
        "nzbToMedia" )
            source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-menu.sh" ;;
        "Unrar" )
            source "$SCRIPTPATH/utils/unrar/unrar-menu.sh" ;;
        "pyLoad" )
            source "$SCRIPTPATH/pyload/pyload-menu.sh" ;;
        "Install Bash Aliases" )
            source "$SCRIPTPATH/utils/bash_aliases-installer.sh" ;;
        "Go Back" )
            source "$SCRIPTPATH/menus/menu-main.sh" ;;
        *)
            source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
    source "$SCRIPTPATH/inc/thankyou.sh"
    source "$SCRIPTPATH/inc/exit.sh"
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 0
fi
