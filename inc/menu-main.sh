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
"CouchPotato" "Movies PVR Client" \
"Headphones" "Music PVR Client" \
"Mylar" "Comics PVR Client" \
"HTPC Manager" "Unified HTPC Web Interface" \
"SABnzbd+" "NZB Newsgrabber / Downloader" \
"Webmin" "Web-based system administration" \
"Sonarr" "TV Shows PVR Client" \
"Transmission" "Bittorent Client" \
"qBittorrent" "Bittorrent Client" \
"Plex Server" "Media Server" \
"Utilities" "Other miscellaneous tools" \
"Coming Soon" "Apps planned for future" \
"Maintenance" "Perform maintenance tasks" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo -e $ENDCOLOR"Your chosen option:" $MAINCHOICE
    case "$MAINCHOICE" in 
		"SickBeard" ) source $SCRIPTPATH/inc/menu-sickbeard.sh ;;
		"SickRage" ) source $SCRIPTPATH/inc/menu-sickrage.sh ;;
		"SickGear" ) source $SCRIPTPATH/inc/menu-sickgear.sh ;;
		"Sonarr" ) source $SCRIPTPATH/inc/menu-nzbdrone.sh ;;
		"CouchPotato" ) source $SCRIPTPATH/inc/menu-couchpotato.sh ;;
		"Transmission" ) source $SCRIPTPATH/inc/menu-transmission.sh ;;
		"qBittorrent" ) source $SCRIPTPATH/inc/menu-qbittorrent-nox.sh ;;
		"SABnzbd+" ) source $SCRIPTPATH/inc/menu-sabnzbdplus.sh ;;
		"Headphones" ) source $SCRIPTPATH/inc/menu-headphones.sh ;;
		"Mylar" ) source $SCRIPTPATH/inc/menu-mylar.sh ;;
		"HTPC Manager" ) source $SCRIPTPATH/inc/menu-htpcmanager.sh ;;
		"Plex" ) source $SCRIPTPATH/inc/menu-plex.sh ;;
		"Webmin" ) source $SCRIPTPATH/inc/menu-webmin.sh ;;
		"Utilities" ) source $SCRIPTPATH/inc/menu-utils.sh ;;
		"Coming Soon" ) source $SCRIPTPATH/inc/menu-comingsoon.sh ;;
		"Maintenance" ) source $SCRIPTPATH/inc/menu-maintenance.sh ;;
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
