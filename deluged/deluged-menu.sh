#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage Deluge" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Install" "Install Deluge" \
"Uninstall" "Uninstall Deluge" \
"Backup" "Backup Deluge settings" \
"Restore" "Restore Deluge settings from a previous backup" \
"Manual Update" "Manually update Deluge" \
"Access Details" "View Deluge access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/deluged/deluged-constants.sh
    case "$SUBCHOICE" in 
        "Install" ) source $SCRIPTPATH/deluged/deluged-installer.sh ;;
        "Uninstall" ) source $SCRIPTPATH/deluged/deluged-uninstaller.sh ;;
        "Backup" ) source $SCRIPTPATH/inc/app-backup-controller.sh ;;
        "Restore" ) source $SCRIPTPATH/inc/app-restore-controller.sh ;;
        "Manual Update" ) source $SCRIPTPATH/deluged/deluged-update.sh ;;
        "Access Details" ) 
        APPSETTINGS=$APPPATH'/web.conf'
        source $SCRIPTPATH/inc/app-access-details.sh ;;    
        "Go Back" ) source $SCRIPTPATH/menus/menu-bittorrent.sh ;;
        *) source $SCRIPTPATH/inc/invalid-option.sh ;;
    esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi