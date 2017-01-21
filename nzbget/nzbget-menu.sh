#!/bin/bash
# Script Name: AtoMiC NZBGet Menu
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage NZBGet" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" $LINES $COLUMNS $NETLINES \
"Install" "Install NZBGet" \
"Uninstall" "Uninstall NZBGet" \
"Backup" "Backup NZBGet settings" \
"Restore" "Restore NZBGet settings from a previous backup" \
"Reset Password" "Reset NZBGet WebUI password" \
"Access Details" "View NZBGet access details" \
"Access Switch" "Toggle NZBGet UI network accessibility" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/nzbget/nzbget-constants.sh
    case "$SUBCHOICE" in 
        "Install" ) source $SCRIPTPATH/nzbget/nzbget-installer.sh ;;
        "Uninstall" ) source $SCRIPTPATH/nzbget/nzbget-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/inc/app-backup-controller.sh ;;
        "Restore" ) source $SCRIPTPATH/nzbget/nzbget-restore.sh ;;
        "Reset Password" ) source $SCRIPTPATH/nzbget/nzbget-reset.sh ;;
        "Access Details" ) source $SCRIPTPATH/inc/app-access-details.sh ;;
        "Access Switch" ) source $SCRIPTPATH/inc/app-access-switch.sh ;;
        "Go Back" ) source $SCRIPTPATH/inc/menu-main.sh ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/menu-main.sh
fi