#!/bin/bash
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Maintenance Menu" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" 25 78 15 \
"Default Credentials" "See default credentials for apps" \
"Clear Temp Files" "Clear disclaimer consent and user info" \
"Delete Backups" "Delete backups" \
"Update ToolKit" "Update AtoMiC ToolKit" \
"SCRIPTPATH" "$SCRIPTPATH" \
"UNAME" "$UNAME" \
"UGROUP" "$UGROUP" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Default Credentials" ) source $SCRIPTPATH/maintenance/defaults.sh ;;
		"Clear Temp Files" ) source $SCRIPTPATH/maintenance/cleartmp.sh ;;
		"Delete Backups" ) source $SCRIPTPATH/maintenance/clearbackups.sh ;;
		"Update ToolKit" ) source $SCRIPTPATH/maintenance/update.sh ;;
		"Go Back" ) source $SCRIPTPATH/sonarr/main-menu ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/main-menu.sh
fi
