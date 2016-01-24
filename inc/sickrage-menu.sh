#!/bin/bash
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage SickRage" --menu "What would you like to do?" 25 78 16 \
"Install" "Install SickRage" \
"Uninstall" "Uninstall SickRage" \
"Backup" "Backup SickRage settings" \
"Restore" "Restore SickRage settings from a previous backup" \
"Manual Update" "Manually update SickRage" \
"SCRIPTPATH" "$SCRIPTPATH" \
"UNAME" "$UNAME" \
"UGROUP" "$UGROUP" \
"Main Menu" "Go back to main menu." 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/sickrage/sickrage-installer.sh ;;
		"Uninstall" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Backup" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Restore" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Manual Update" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		*) source $SCRIPTPATH/inc/main-menu.sh ;;
	esac
else
    source $SCRIPTPATH/inc/main-menu.sh
fi
