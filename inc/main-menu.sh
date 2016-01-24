#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
MAINCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" --menu "Which app would you like to manage?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"SickBeard" "TV Shows PVR Client" \
"SickRage" "TV Shows PVR Client" \
"SickGear" "TV Shows PVR Client" \
"Sonarr" "TV Shows PVR Client" \
"CouchPotato" "Movies PVR Client" \
"Transmission" "Bittorent Client" \
"qBittorrent" "Bittorrent Client" \
"SABnzbd" "NZB Newsgrabber / Downloader" \
"Headphones" "Music PVR Client" \
"Mylar" "Comics PVR Client" \
"HTPC Manager" "Unified HTPC Web Interface" \
"Plex Server" "Media Server" \
"Webmin" "Web-based system administration" \
"Utilities" "Other miscellaneous tools" \
"Coming Soon" "Apps planned for future" \
"Maintenance" "Perform maintenance tasks" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo -e $ENDCOLOR"Your chosen option:" $MAINCHOICE
    case "$MAINCHOICE" in 
		"SickBeard" ) source $SCRIPTPATH/inc/sickbeard-menu.sh;;
		"SickRage" ) source $SCRIPTPATH/inc/sickrage-menu.sh ;;
		"SickGear" ) source $SCRIPTPATH/inc/sickgear-menu.sh ;;
		"Sonarr" ) source $SCRIPTPATH/inc/sonarr-menu.sh ;;
		"CouchPotato" ) source $SCRIPTPATH/inc/couchpotato-menu.sh ;;
		"Transmission" ) source $SCRIPTPATH/inc/transmission-menu.sh ;;
		"qBittorrent" ) source $SCRIPTPATH/inc/qbittorrent-menu.sh ;;
		"SABnzbd" ) source $SCRIPTPATH/inc/sabnzbd-menu.sh ;;
		"Headphones" ) source $SCRIPTPATH/inc/headphones-menu.sh ;;
		"Mylar" ) source $SCRIPTPATH/inc/mylar-menu.sh ;;
		"HTPC Manager" ) source $SCRIPTPATH/inc/htpcmanager-menu.sh ;;
		"Plex" ) source $SCRIPTPATH/inc/plex-menu.sh ;;
		"Webmin" ) source $SCRIPTPATH/inc/webmin-menu.sh ;;
		"Utilities" ) source $SCRIPTPATH/inc/utils-menu.sh ;;
		"Coming Soon" ) source $SCRIPTPATH/inc/comingsoon-menu.sh ;;
		"Maintenance" ) source $SCRIPTPATH/inc/maintenance-menu.sh ;;
		*) 
		echo -e $RED'Invalid Option'$ENDCOLOR
		source $SCRIPTPATH/inc/exit.sh
		;;
	esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi
