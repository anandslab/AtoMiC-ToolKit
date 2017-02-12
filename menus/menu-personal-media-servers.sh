#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" --menu "Which app would you like to manage?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Emby" "Organize, play, and stream audio and video" \
"Plex" "organizes all of your video, music, and photo collections" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    case "$SUBCHOICE" in
    "Emby" ) source $SCRIPTPATH/emby-server/emby-server-menu.sh ;;
    "Go Back" ) source $SCRIPTPATH/menus/menu-main.sh ;; 
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi
