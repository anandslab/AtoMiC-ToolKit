#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage qBittorrent" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
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
    source $SCRIPTPATH//qbittorrent-nox/qbittorrent-nox-constants.sh
    case "$SUBCHOICE" in 
        "Install" ) source $SCRIPTPATH/qbittorrent-nox/qbittorrent-nox-installer.sh ;;
        "Uninstall" ) source $SCRIPTPATH/qbittorrent-nox/qbittorrent-nox-uninstaller.sh ;;
        "Backup" ) source $SCRIPTPATH/inc/app-backup-controller.sh ;;
        "Restore" ) source $SCRIPTPATH/inc/app-restore-controller.sh ;;
        "Manual Update" ) source $SCRIPTPATH/qbittorrent-nox/qbittorrent-nox-update.sh ;;
        "Reset Password" ) source $SCRIPTPATH/inc/app-password-reset-controller.sh ;;
        "Access Details" ) source $SCRIPTPATH/inc/app-access-details.sh ;;
        "Go Back" ) source $SCRIPTPATH/menus/menu-bittorrent.sh ;;
        *) source $SCRIPTPATH/inc/invalid-option.sh ;;
    esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi
