#eval `resize`
#$LINES $COLUMNS $(( $LINES - 15 )) 25 78 16 
MAINCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" --menu "Which app would you like to manage?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" 25 78 15 \
"SickBeard" "" \
"SickRage" "" \
"SickGear" "" \
"Sonarr" "" \
"CouchPotato" "" \
"Transmission" "" \
"qBittorrent" "" \
"SABnzbd" "" \
"Headphones" "" \
"Mylar" "" \
"HTPC Manager" "" \
"Plex Server" "" \
"Webmin" "" \
"SCRIPTPATH" "$SCRIPTPATH" \
"UNAME" "$UNAME" \
"UGROUP" "$UGROUP" \
"Maintenance" "" 3>&1 1>&2 2>&3)

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
