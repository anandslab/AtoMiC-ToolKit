#!/bin/bash
# Script Name: AtoMiC Lazy Librarian menu
# Author: TommyE123
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
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage Lazy Librarian" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" $LINES $COLUMNS $NETLINES \
"Install" "Install Lazy Librarian" \
"Uninstall" "Uninstall Lazy Librarian" \
"Backup" "Backup Lazy Librarian settings" \
"Restore" "Restore Lazy Librarian settings from a previous backup" \
"Manual Update" "Manually update Lazy Librarian" \
"Reset Password" "Reset Lazy Librarian WebUI password" \
"Access Details" "View Lazy Librarian access details" \
"Access Switch" "Toggle NZBGet UI network accessibility" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/lazylibrarian/lazylibrarian-constants.sh
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/lazylibrarian/lazylibrarian-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/lazylibrarian/lazylibrarian-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/lazylibrarian/lazylibrarian-backup.sh ;;
		"Restore" ) source $SCRIPTPATH/lazylibrarian/lazylibrarian-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/lazylibrarian/lazylibrarian-update.sh ;;
        "Reset Password" ) source $SCRIPTPATH/lazylibrarian/lazylibrarian-reset.sh ;;
        "Access Details" ) source $SCRIPTPATH/inc/app-access-details.sh ;;
        "Access Switch" ) source $SCRIPTPATH/inc/app-access-switch.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/menu-main.sh ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/menu-main.sh
fi
