#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage Emby" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Install" "Install Emby" \
"Uninstall" "Uninstall Emby" \
"Backup" "Backup Emby settings" \
"Restore" "Restore Emby settings from a previous backup" \
"Manual Update" "Manually update Emby+" \
"Reset Password" "Reset Emby WebUI password" \
"Access Details" "View Emby access details" \
"Access Switch" "Toggle Emby UI network accessibility" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
	source $SCRIPTPATH/emby-server/emby-server-constants.sh
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/emby-server/emby-server-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/emby-server/emby-server-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/inc/app-backup-controller.sh ;;
		"Restore" ) source $SCRIPTPATH/inc/app-restore-controller.sh ;;
		"Manual Update" ) source $SCRIPTPATH/emby-server/emby-server-update.sh ;;
		"Reset Password" ) source $SCRIPTPATH/inc/app-password-reset-controller.sh ;;
        "Access Details" ) source $SCRIPTPATH/inc/app-access-details.sh ;;
		"Access Switch" ) source $SCRIPTPATH/inc/app-access-switch.sh ;;
		"Go Back" ) source $SCRIPTPATH/menus/menu-usenet.sh ;;
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi
