#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
MAINCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" --menu "Which app would you like to manage?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"PVRs" "Automatic Media Library Manager" \
"Usenet Downloaders" "Download binary files from Usenet servers" \
"Bittorrent Clients" "Download Torrents" \
"Personal Media Servers" "Organise and serve Media" \
"Home Theater" "Media Playback" \
"Administration Tools" "system configuration tools e.g. Webmin" \
"Utilities" "Other miscellaneous tools" \
"Maintenance" "Perform maintenance tasks" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/inc/app-constant-reset.sh
    case "$MAINCHOICE" in 
      "PVRs" ) source $SCRIPTPATH/menus/menu-pvrs.sh ;;
      "Usenet Downloaders" ) source $SCRIPTPATH/menus/menu-usenet.sh ;;
      "Bittorrent Clients" ) source $SCRIPTPATH/menus/menu-bittorrent.sh ;;
      "Personal Media Servers" ) source $SCRIPTPATH/menus/menu-personal-media-servers.sh ;;
      "Home Theater" ) source $SCRIPTPATH/menus/menu-home-theater.sh ;;
      "Administration Tools" ) source $SCRIPTPATH/menus/menu-administration-tools.sh ;;
      "Utilities" ) source $SCRIPTPATH/utils/utils-menu.sh ;;
      "Maintenance" ) source $SCRIPTPATH/maintenance/maintenance-menu.sh ;;
      *) 
        echo -e $RED'Invalid Option'$ENDCOLOR
        source $SCRIPTPATH/inc/exit.sh;;
    esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi
