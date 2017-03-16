#!/bin/bash
# Script Name: AtoMiC NZBHydra menu
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
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage NZBHydra" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Install" "Install NZBHydra" \
"Uninstall" "Uninstall NZBHydra" \
"Backup" "Backup NZBHydra settings" \
"Restore" "Restore NZBHydra settings from a previous backup" \
"Manual Update" "Manually update NZBHydra" \
"Access Details" "View NZBHydra access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/nzbhydra/nzbhydra-constants.sh
    case "$SUBCHOICE" in 
        "Install" ) source $SCRIPTPATH/nzbhydra/nzbhydra-installer.sh ;;
        "Uninstall" ) source $SCRIPTPATH/nzbhydra/nzbhydra-uninstaller.sh ;;
        "Backup" ) source $SCRIPTPATH/inc/app-backup-controller.sh ;;
        "Restore" ) source $SCRIPTPATH/inc/app-restore-controller.sh ;;
        "Manual Update" ) source $SCRIPTPATH/nzbhydra/nzbhydra-update.sh ;;
        "Access Details" ) source $SCRIPTPATH/inc/app-access-details.sh ;;
        "Go Back" ) source $SCRIPTPATH/menus/menu-usenet.sh ;;
        *) source $SCRIPTPATH/inc/invalid-option.sh ;;
    esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi
