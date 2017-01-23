#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage SABnzbd" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" $LINES $COLUMNS $NETLINES \
"Install" "Install SABnzbd" \
"Uninstall" "Uninstall SABnzbd" \
"Backup" "Backup SABnzbd settings" \
"Restore" "Restore SABnzbd settings from a previous backup" \
"Manual Update" "Manually update SABnzbd+" \
"Reset Password" "Reset SABnzbd WebUI password" \
"Access Details" "View SABnzbd access details" \
"Access Switch" "Toggle SABnzbd UI network accessibility" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
	source $SCRIPTPATH/sabnzbdplus/sabnzbdplus-constants.sh
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/sabnzbdplus/sabnzbdplus-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/sabnzbdplus/sabnzbdplus-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/inc/app-backup-controller.sh ;;
		"Restore" ) source $SCRIPTPATH/sabnzbdplus/sabnzbdplus-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/sabnzbdplus/sabnzbdplus-update.sh ;;
		"Reset Password" ) source $SCRIPTPATH/sabnzbdplus/sabnzbdplus-reset.sh ;;
        "Access Details" ) source $SCRIPTPATH/inc/app-access-details.sh ;;
		"Access Switch" ) source $SCRIPTPATH/inc/app-access-switch.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/menu-main.sh ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/menu-main.sh
fi
