#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage SickGear" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Install" "Install SickGear" \
"Uninstall" "Uninstall SickGear" \
"Backup" "Backup SickGear settings" \
"Restore" "Restore SickGear settings from a previous backup" \
"Manual Update" "Manually update SickGear" \
"Reset Password" "Reset SickGear WebUI password" \
"Access Details" "View SickGear access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/sickgear/sickgear-constants.sh
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/sickgear/sickgear-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/sickgear/sickgear-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/inc/app-backup-controller.sh ;;
		"Restore" ) source $SCRIPTPATH/inc/app-restore-controller.sh ;;
		"Manual Update" ) source $SCRIPTPATH/sickgear/sickgear-update.sh ;;
        "Reset Password" ) source $SCRIPTPATH/inc/app-password-reset-controller.sh ;;
        "Access Details" ) source $SCRIPTPATH/inc/app-access-details.sh ;;
		"Go Back" ) source $SCRIPTPATH/menus/menu-pvrs.sh ;;
        *) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/menus/menu-pvrs.sh
fi
