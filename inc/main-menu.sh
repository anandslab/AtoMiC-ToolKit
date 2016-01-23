#!/bin/bash
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
"Maintenance" "List all groups on the system." 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Your chosen option:" $MAINCHOICE
    case "$MAINCHOICE" in 
		"SickBeard" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"SickRage" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
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
    source $SCRIPTPATH/inc/exit.sh
fi
