#!/bin/bash
# Script Name: AtoMiC CouchPotato Menu
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

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
"Reset Password" "Reset CouchPotato WebUI password" \
"Access Details" "View CouchPotato access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/couchpotato/couchpotato-constants.sh
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/couchpotato/couchpotato-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/couchpotato/couchpotato-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/inc/app-backup-controller.sh ;;
		"Restore" ) source $SCRIPTPATH/couchpotato/couchpotato-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/couchpotato/couchpotato-update.sh ;;
        "Reset Password" ) source $SCRIPTPATH/couchpotato/couchpotato-reset.sh ;;
        "Access Details" ) source $SCRIPTPATH/inc/app-access-details.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/menu-main.sh ;;
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/menu-main.sh
fi
