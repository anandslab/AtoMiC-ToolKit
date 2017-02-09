#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Upcoming App Support" --menu "These apps may be supported in future." --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Deluge" "Bittorrent Client" \
"Apache" "Apache Webserver" \
"MySQL" "MySQL Server" \
"Emby" "Media Server" \
"Plex" "Media Server" \
"PyLoad" "Storage and Download Client" \
"Jackett" "Torrent trackers for Sonarr" \
"nzbHydra" "Meta search for NZB Indexers" \
"Make MKV" "Video Converter" \
"Musicbrainz" "Music Tagger for Headphones" \
"Monit" "Monitor your home server or HTPC" \
"ShellInABox" "Web-based terminal" \ 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    case "$SUBCHOICE" in 
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/menus/menu-main.sh
fi
