#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage PlexPy" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Install" "Install PlexPy" \
"Uninstall" "Uninstall PlexPy" \
"Backup" "Backup PlexPy settings" \
"Restore" "Restore PlexPy settings from a previous backup" \
"Manual Update" "Manually update PlexPy" \
"Access Details" "View PlexPy access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/plexpy/plexpy-constants.sh
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/plexpy/plexpy-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/plexpy/plexpy-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/inc/app-backup-controller.sh ;;
		"Restore" ) source $SCRIPTPATH/inc/app-restore-controller.sh ;;
		"Manual Update" ) source $SCRIPTPATH/plexpy/plexpy-update.sh ;;
        "Access Details" ) source $SCRIPTPATH/inc/app-access-details.sh ;;
		"Go Back" ) source $SCRIPTPATH/menus/menu-personal-media-servers.sh ;;
        *) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/menus/menu-pvrs.sh
fi
