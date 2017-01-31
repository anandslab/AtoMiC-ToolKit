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
"Reset Password" "Reset SickRage WebUI password" \
"Access Details" "View SickRage access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/sickrage/sickrage-constants.sh
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/sickrage/sickrage-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/sickrage/sickrage-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/inc/app-backup-controller.sh ;;
		"Restore" ) source $SCRIPTPATH/sickrage/sickrage-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/sickrage/sickrage-update.sh ;;
        "Reset Password" ) source $SCRIPTPATH/sickrage/sickrage-reset.sh ;;
        "Access Details" ) source $SCRIPTPATH/inc/app-access-details.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/menu-main.sh ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/menu-main.sh
fi
