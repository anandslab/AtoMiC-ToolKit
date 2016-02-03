#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage Sonarr" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" $LINES $COLUMNS $NETLINES \
"Install" "Install Sonarr" \
"Uninstall" "Uninstall Sonarr" \
"Backup" "Backup Sonarr settings" \
"Restore" "Restore Sonarr settings from a previous backup" \
"Manual Update" "Manually update Sonarr+" \
"Access Details" "View Sonarr access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/nzbdrone/sonarr-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/nzbdrone/sonarr-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/nzbdrone/sonarr-backup.sh ;;
		"Restore" ) source $SCRIPTPATH/nzbdrone/sonarr-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/nzbdrone/sonarr-update.sh ;;
        "Access Details" ) source $SCRIPTPATH/nzbdrone/sonarr-access.sh ;;		
		"Go Back" ) source $SCRIPTPATH/inc/menu-main.sh ;;
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/menu-main.sh
fi
