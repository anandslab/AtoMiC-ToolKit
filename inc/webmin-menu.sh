#!/bin/bash
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage Webmin" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" 25 78 15 \
"Install" "Install Webmin" \
"Uninstall" "Uninstall Webmin" \
"Backup" "Backup Webmin settings" \
"Restore" "Restore Webmin settings from a previous backup" \
"Reset Password" "Rest Webmin WebUI password" \
"SCRIPTPATH" "$SCRIPTPATH" \
"UNAME" "$UNAME" \
"UGROUP" "$UGROUP" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/webmin/webmin-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/webmin/webmin-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/webmin/webmin-backup.sh ;;
		"Restore" ) source $SCRIPTPATH/webmin/webmin-restore.sh ;;
		"Go Back" ) source $SCRIPTPATH/sonarr/main-menu ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/main-menu.sh
fi
