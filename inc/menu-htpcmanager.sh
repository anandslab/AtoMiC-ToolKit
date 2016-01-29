#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage HTPC Manager" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" $LINES $COLUMNS $NETLINES \
"Install" "Install HTPC Manager" \
"Uninstall" "Uninstall HTPC Manager" \
"Backup" "Backup HTPC Manager settings" \
"Restore" "Restore HTPC Manager settings from a previous backup" \
"Manual Update" "Manually update HTPC Manager" \
"Access Details" "View HTPC Manager access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/htpcmanager/htpcmanager-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/htpcmanager/htpcmanager-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/htpcmanager/htpcmanager-backup.sh ;;
		"Restore" ) source $SCRIPTPATH/htpcmanager/htpcmanager-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/htpcmanager/htpcmanager-update.sh ;;
        "Access Details" ) source $SCRIPTPATH/htpcmanager/htpcmanager-access.sh ;;        
		"Go Back" ) source $SCRIPTPATH/inc/menu-main.sh ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/menu-main.sh
fi