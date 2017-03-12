#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" --menu "Which app would you like to manage?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"HTPC Manager" "Unified HTPC Web Interface" \
"Ombi" "Allow your users to Request Movies, TV Shows and Albums" \
"Webmin" "Web-based system administration" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/inc/app-constant-reset.sh
    case "$SUBCHOICE" in
      "HTPC Manager" ) source $SCRIPTPATH/htpcmanager/htpcmanager-menu.sh ;;
	  "Ombi" ) source $SCRIPTPATH/ombi/ombi-menu.sh ;;
      "Webmin" ) source $SCRIPTPATH/webmin/webmin-menu.sh ;;
      "Go Back" ) source $SCRIPTPATH/menus/menu-main.sh ;;
      *) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi
