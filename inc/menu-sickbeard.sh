#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage SickBeard" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" $LINES $COLUMNS $NETLINES \
"Install" "Install SickBeard" \
"Uninstall" "Uninstall SickBeard" \
"Backup" "Backup SickBeard settings" \
"Restore" "Restore SickBeard settings from a previous backup" \
"Manual Update" "Manually update SickBeard" \
"Reset Password" "Reset SickBeard WebUI password" \
"Access Details" "View SickBeard access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/sickbeard/sickbeard-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/sickbeard/sickbeard-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/sickbeard/sickbeard-backup.sh ;;
		"Restore" ) source $SCRIPTPATH/sickbeard/sickbeard-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/sickbeard/sickbeard-update.sh ;;
		"Reset Password" ) source $SCRIPTPATH/sickbeard/sickbeard-reset.sh ;;
		"Access Details" ) source $SCRIPTPATH/sickbeard/sickbeard-access.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/menu-main.sh ;;
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/menu-main.sh
fi
