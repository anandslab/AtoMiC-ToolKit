#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage qBittorrent" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" $LINES $COLUMNS $NETLINES \
"Install" "Install qBittorrent-nox (WebUI only)" \
"Uninstall" "Uninstall qBittorrent" \
"Backup" "Backup qBittorrent settings" \
"Restore" "Restore qBittorrent settings from a previous backup" \
"Manual Update" "Manually update qBittorrent" \
"Reset Password" "Reset qBittorrent WebUI password" \
"Access Details" "View qBittorrent access details" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/qbittorrent-nox/qbittorrent-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/qbittorrent-nox/qbittorrent-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/qbittorrent-nox/qbittorrent-backup.sh ;;
		"Restore" ) source $SCRIPTPATH/qbittorrent-nox/qbittorrent-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/qbittorrent-nox/qbittorrent-update.sh ;;
        "Reset Password" ) source $SCRIPTPATH/qbittorrent-nox/qbittorrent-reset.sh ;;
        "Access Details" ) source $SCRIPTPATH/qbittorrent-nox/qbittorrent-access.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/menu-main.sh ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/menu-main.sh
fi
