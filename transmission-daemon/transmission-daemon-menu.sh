#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage Transmission" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" $LINES $COLUMNS $NETLINES \
"Install" "Install Transmission" \
"Uninstall" "Uninstall Transmission" \
"Backup" "Backup Transmission settings" \
"Restore" "Restore Transmission settings from a previous backup" \
"Manual Update" "Manually update Transmission+" \
"Reset Password" "Reset Transmission WebUI password" \
"Access Details" "View Transmission access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/transmission-daemon/transmission-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/transmission-daemon/transmission-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/transmission-daemon/transmission-backup.sh ;;
		"Restore" ) source $SCRIPTPATH/transmission-daemon/transmission-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/transmission-daemon/transmission-update.sh ;;
        "Reset Password" ) source $SCRIPTPATH/transmission-daemon/transmission-reset.sh ;;
        "Access Details" ) source $SCRIPTPATH/transmission-daemon/transmission-access.sh ;;		
		"Go Back" ) source $SCRIPTPATH/inc/menu-main.sh ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/menu-main.sh
fi