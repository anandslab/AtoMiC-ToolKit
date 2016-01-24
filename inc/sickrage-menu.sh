#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage SickRage" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" $LINES $COLUMNS $NETLINES \
"Install" "Install SickRage" \
"Uninstall" "Uninstall SickRage" \
"Backup" "Backup SickRage settings" \
"Restore" "Restore SickRage settings from a previous backup" \
"Manual Update" "Manually update SickRage" \
"Reset Password" "Rest SickRage WebUI password" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/sickrage/sickrage-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/sickrage/sickrage-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/sickrage/sickrage-backup.sh ;;
		"Restore" ) source $SCRIPTPATH/sickrage/sickrage-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/sickrage/sickrage-update.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/main-menu.sh ;;		
		*) 
		echo -e $RED'Invalid option or feature not implemented yet.'$ENDCOLOR
		source $SCRIPTPATH/inc/main-menu.sh
		;;
	esac
else
    source $SCRIPTPATH/inc/main-menu.sh
fi
