#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage CouchPotato" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" $LINES $COLUMNS $NETLINES \
"Install" "Install CouchPotato" \
"Uninstall" "Uninstall CouchPotato" \
"Backup" "Backup CouchPotato settings" \
"Restore" "Restore CouchPotato settings from a previous backup" \
"Manual Update" "Manually update CouchPotato" \
"Reset Password" "Rest CouchPotato WebUI password" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/couchpotato/couchpotato-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/couchpotato/couchpotato-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/couchpotato/couchpotato-backup.sh ;;
		"Restore" ) source $SCRIPTPATH/couchpotato/couchpotato-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/couchpotato/couchpotato-update.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/main-menu.sh ;;
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/main-menu.sh
fi
