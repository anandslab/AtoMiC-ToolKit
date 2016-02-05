#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Maintenance Menu" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" $LINES $COLUMNS $NETLINES \
"Clear Temp Files" "Clear disclaimer consent and user info" \
"Delete Backups" "Delete app backups" \
"Update ToolKit" "Update AtoMiC ToolKit" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Clear Temp Files" ) source $SCRIPTPATH/maintenance/cleartmp.sh ;;
		"Delete Backups" ) source $SCRIPTPATH/maintenance/clearbackups.sh ;;
		"Update ToolKit" ) source $SCRIPTPATH/maintenance/update.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/menu-main.sh ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/menu-main.sh
fi
