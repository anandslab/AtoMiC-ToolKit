#eval `resize`
#$LINES $COLUMNS $(( $LINES - 15 )) 25 78 16 
MAINCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" --menu "What would you like to do?" 25 78 16 \
"SickBeard" "Install, Uninstall, Backup, Restore, and Update." \
"SickRage" "Install, Uninstall, Backup, Restore, and Update." \
"SickGear" "Install, Uninstall, Backup, Restore, and Update." \
"Sonarr" "Install and Uninstall" \
"CouchPotato" "Install, Uninstall, Backup, Restore, and Update." \
"Transmission" "Install (headless) and Uninstall." \
"qBittorrent" "Install (headless) and Uninstall." \
"SABnzbd" "Install and Uninstall." \
"Headphones" "Install and Uninstall." \
"Mylar" "Install and Uninstall." \
"HTPC Manager" "Install and Uninstall." \
"Plex Server" "Install." \
"Webmin" "Modify a group and its list of members." \
"SCRIPTPATH" "$SCRIPTPATH" \
"UNAME" "$UNAME" \
"UGROUP" "$UGROUP" \
"Maintenance" "List all groups on the system." 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo -e $ENDCOLOR"Your chosen option:" $MAINCHOICE
    case "$MAINCHOICE" in 
		"SickBeard" ) source $SCRIPTPATH/inc/sickrage-menu.sh;;
		"SickRage" ) source $SCRIPTPATH/inc/sickrage-menu.sh ;;
		"SickGear" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Sonarr" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"CouchPotato" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Transmission" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"qBittorrent" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"SABnzbd" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Headphones" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Mylar" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"HTPC Manager" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Plex" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Webmin" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Maintenance" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
	#*) echo "Exit" ;;
	esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi
