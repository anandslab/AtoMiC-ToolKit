#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage Kodi" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Install" "Install Kodi" \
"Enable" "Kodi to Launch on Boot" \
"Disable" "Kodi to Launch on Boot" \
"Uninstall" "Uninstall Kodi" \
"Manual Update" "Manually update Kodi" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
	source $SCRIPTPATH/kodi/kodi-constants.sh
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/kodi/kodi-installer.sh ;;
    "Enable" ) source $SCRIPTPATH/kodi/kodi-enable-startup.sh
               source $SCRIPTPATH/kodi/kodi-menu.sh;;
    "Disable" ) source $SCRIPTPATH/kodi/kodi-remove-startup.sh 
                source $SCRIPTPATH/kodi/kodi-menu.sh;;
		"Uninstall" ) source $SCRIPTPATH/kodi/kodi-uninstaller.sh ;;
		"Manual Update" ) source $SCRIPTPATH/kodi/kodi-update.sh ;;
		"Go Back" ) source $SCRIPTPATH/menus/menu-personal-media-servers.sh ;;
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi
