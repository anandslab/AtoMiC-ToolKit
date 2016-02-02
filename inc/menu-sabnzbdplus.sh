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
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/sabnzbdplus/sabnzbd-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/sabnzbdplus/sabnzbd-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/sabnzbdplus/sabnzbd-backup.sh ;;
		"Restore" ) source $SCRIPTPATH/sabnzbdplus/sabnzbd-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/sabnzbdplus/sabnzbd-update.sh ;;
		"Reset Password" ) source $SCRIPTPATH/sabnzbdplus/sabnzbd-reset.sh ;;
        "Access Details" ) source $SCRIPTPATH/sabnzbdplus/sabnzbd-access.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/menu-main.sh ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/menu-main.sh
fi
