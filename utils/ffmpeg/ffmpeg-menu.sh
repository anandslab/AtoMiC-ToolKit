#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage FFmpeg" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Install\Update" "FFmpeg, FFmpeg-10bit, FFprobe, FFserver" \
"Uninstall" "FFmpeg, FFmpeg-10bit, FFprobe, FFserver" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    case "$SUBCHOICE" in 
		"Install\Update" ) source $SCRIPTPATH/utils/ffmpeg/ffmpeg-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/utils/ffmpeg/ffmpeg-uninstaller.sh ;;
		"Go Back" ) source $SCRIPTPATH/utils/utils-menu.sh ;;
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
    exit 1
fi
