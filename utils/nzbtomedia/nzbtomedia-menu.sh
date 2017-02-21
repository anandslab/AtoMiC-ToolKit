#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage nzbToMedia" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Install" "nzbTomedia Scripts" \
"Update" "nzbTomedia Scripts" \
"Uninstall" "nzbTomedia Scripts" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/utils/nzbtomedia/nzbtomedia-constants.sh
    case "$SUBCHOICE" in 
      "Install" ) source $SCRIPTPATH/utils/nzbtomedia/nzbtomedia-installer.sh ;;
      "Update" ) source $SCRIPTPATH/utils/nzbtomedia/nzbtomedia-update.sh ;;
      "Uninstall" ) source $SCRIPTPATH/utils/nzbtomedia/nzbtomedia-uninstaller.sh ;;
      "Go Back" ) source $SCRIPTPATH/utils/utils-menu.sh ;;
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
    exit 1
fi
