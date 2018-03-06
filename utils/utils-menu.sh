#!/bin/bash

# Script Name: AtoMiC Utils Menu
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Other Tools" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Certbot" "Automatically obtain certs from Let's Encrypt" \
"FFmpeg" "Record, convert and stream audio and video" \
"Java 8" "general-purpose computer programming language" \
"Mono" "Open source implementation of MS .NET Framework" \
"Nginx" "High-performance HTTP server and reverse proxy" \
"Node.js" "platform for building server apps using JavaScript" \
"nzbToMedia" "Provides NZB and Torrent postprocessing" \
"OpenVPN" "VPN APP for creating secure point-to-point connections" \
"PHP 7.x" "open source general-purpose scripting language" \
"PIA" "Private Internet Access VPN Service + Ad-blocking" \
"pyLoad" "Download manager, lightweight and remotely manageable" \
"Python" "python programming packages" \
"Unrar" "Install latest Unrar from RARLAB source" \
"Install Bash Aliases" "Allows shortening commands" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    case "$SUBCHOICE" in
        "Certbot" )
            source "$SCRIPTPATH/utils/certbot/certbot-menu.sh" ;;
        "FFmpeg" )
            source "$SCRIPTPATH/utils/ffmpeg/ffmpeg-menu.sh" ;;
        "Java 8" )
            source "$SCRIPTPATH/utils/java/java-menu.sh" ;;
        "Mono" )
            source "$SCRIPTPATH/utils/mono/mono-menu.sh" ;;
        "Nginx" )
            source "$SCRIPTPATH/utils/nginx/nginx-menu.sh" ;;
        "Node.js" )
            source "$SCRIPTPATH/utils/nodejs/nodejs-menu.sh" ;;
        "nzbToMedia" )
            source "$SCRIPTPATH/utils/nzbtomedia/nzbtomedia-menu.sh" ;;
        "OpenVPN" )
            source "$SCRIPTPATH/utils/openvpn/openvpn-menu.sh" ;;
        "PHP 7.x" )
            source "$SCRIPTPATH/utils/php/php-menu.sh" ;;
        "PIA" )
            source "$SCRIPTPATH/utils/pia/pia-menu.sh" ;;
        "pyLoad" )
            source "$SCRIPTPATH/pyload/pyload-menu.sh" ;;
        "Python" )
            source "$SCRIPTPATH/utils/python/python-menu.sh" ;;
        "RVM" )
            source "$SCRIPTPATH/utils/rvm/rvm-menu.sh" ;;
        "Unrar" )
            source "$SCRIPTPATH/utils/unrar/unrar-menu.sh" ;;
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
