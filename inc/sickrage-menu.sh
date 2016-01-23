#!/bin/bash
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage SickRage" --menu "What would you like to do?" 25 78 16 \
"Install" "Install SickRage" \
"Uninstall" "Uninstall SickRage" \
"Backup" "Backup SickRage settings" \
"Restore" "Restore SickRage settings from a previous backup" \
"Manual Update" "Manually update SickRage" \
"Main Menu" "Go back to main menu." 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Uninstall" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Backup" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Restore" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		"Manual Update" ) sudo bash inc/sickrage-menu.sh "$CALLER" "$SCRIPTPATH" "$UNAME" "$UGROUP" ;;
		*) echo "Exit" ;;
	esac
else
    source $SCRIPTPATH/inc/main-menu.sh
fi
