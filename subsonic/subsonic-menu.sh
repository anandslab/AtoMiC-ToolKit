#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage Subsonic" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Install" "Install Subsonic" \
"Uninstall" "Uninstall Subsonic" \
"Backup" "Backup Subsonic settings" \
"Restore" "Restore Subsonic settings from a previous backup" \
"Manual Update" "Manually update Subsonic" \
"Access Details" "View Subsonic access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/subsonic/subsonic-constants.sh
    case "$SUBCHOICE" in 
        "Install" ) source $SCRIPTPATH/subsonic/subsonic-installer.sh ;;
        "Uninstall" ) source $SCRIPTPATH/subsonic/subsonic-uninstaller.sh ;;
        "Backup" ) source $SCRIPTPATH/inc/app-backup-controller.sh ;;
        "Restore" ) source $SCRIPTPATH/inc/app-restore-controller.sh ;;
        "Manual Update" ) source $SCRIPTPATH/subsonic/subsonic-update.sh ;;
        "Access Details" ) source $SCRIPTPATH/inc/app-access-details.sh ;;
        "Go Back" ) source $SCRIPTPATH/menus/menu-usenet.sh ;;
        *) source $SCRIPTPATH/inc/invalid-option.sh ;;
    esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi
