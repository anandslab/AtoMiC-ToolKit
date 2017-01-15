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
"Lazy Librarian" "Book PVR Client" \
"Mylar" "Comics PVR Client" \
"HTPC Manager" "Unified HTPC Web Interface" \
"SABnzbd+" "NZB Newsgrabber / Downloader" \
"NZBGet" "NZB Newsgrabber / Downloader" \
"Webmin" "Web-based system administration" \
"Sonarr" "TV Shows PVR Client" \
"Transmission" "Bittorent Client" \
"qBittorrent" "Bittorrent Client" \
"Utilities" "Other miscellaneous tools" \
"Coming Soon" "Apps planned for future" \
"Maintenance" "Perform maintenance tasks" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo -e $ENDCOLOR"Your chosen option:" $MAINCHOICE
    case "$MAINCHOICE" in 
		"SickBeard" ) source $SCRIPTPATH/sickbeard/sickbeard-menu.sh ;;
		"SickRage" ) source $SCRIPTPATH/sickrage/sickrage-menu.sh ;;
		"SickGear" ) source $SCRIPTPATH/sickgear/sickgear-menu.sh ;;
		"Sonarr" ) source $SCRIPTPATH/nzbdrone/nzbdrone-menu.sh ;;
		"CouchPotato" ) source $SCRIPTPATH/couchpotato/couchpotato-menu.sh ;;
		"Transmission" ) source $SCRIPTPATH/transmission-daemon/transmission-daemon-menu.sh ;;
		"qBittorrent" ) source $SCRIPTPATH/qbittorrent-nox/qbittorrent-nox-menu.sh ;;
		"SABnzbd+" ) source $SCRIPTPATH/sabnzbdplus/sabnzbdplus-menu.sh ;;
		"NZBGet" ) source $SCRIPTPATH/nzbget/nzbget-menu.sh ;;
		"Headphones" ) source $SCRIPTPATH/headphones/headphones-menu.sh ;;
		"Lazy Librarian" ) source $SCRIPTPATH/lazylibrarian/lazylibrarian-menu.sh ;;
		"Mylar" ) source $SCRIPTPATH/mylar/mylar-menu.sh ;;
		"HTPC Manager" ) source $SCRIPTPATH/htpcmanager/htpcmanager-menu.sh ;;
		"Webmin" ) source $SCRIPTPATH/webmin/webmin-menu.sh ;;
		"Utilities" ) source $SCRIPTPATH/utils/utils-menu.sh ;;
		"Coming Soon" ) source $SCRIPTPATH/inc/menu-comingsoon.sh ;;
		"Maintenance" ) source $SCRIPTPATH/maintenance/maintenance-menu.sh ;;
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
