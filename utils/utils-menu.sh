#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Other Tools" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"FFmpeg" "Record, convert and stream audio and video" \
"Mono" "Open source implementation of Microsoft's .NET Framework" \
"nzbToMedia" "Provides NZB and Torrent postprocessing" \
"Unrar" "Install latest Unrar from RARLAB source" \
"Install Bash Aliases" "Allows shortening commands" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/inc/app-constant-reset.sh
    case "$SUBCHOICE" in 	
      "FFmpeg" ) 
          source $SCRIPTPATH/utils/ffmpeg/ffmpeg-menu.sh ;;
      "Mono" ) 
          source $SCRIPTPATH/utils/mono/mono-menu.sh ;;
      "nzbToMedia" ) 
          source $SCRIPTPATH/utils/nzbtomedia/nzbtomedia-menu.sh ;;
      "Unrar" ) 
       source $SCRIPTPATH/utils/unrar/unrar-menu.sh ;;
      "Install Bash Aliases" ) source $SCRIPTPATH/utils/bash_aliases-installer.sh ;;
      "Go Back" ) source $SCRIPTPATH/menus/menu-main.sh ;;
      *) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi

if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/inc/app-constant-reset.sh
    source $SCRIPTPATH/inc/pause.sh
    source $SCRIPTPATH/utils/utils-menu.sh
fi
