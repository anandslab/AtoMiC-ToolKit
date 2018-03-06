#!/bin/bash



SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Certbot" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install" "Certbot to enable HTTPS on websites with EFF's Certbot" \
"Uninstall" "Certbot" \
"Backup" "Backup LetsEncrypt Certs" \
"Restore" "Restore LetsEncrypt Certs from a previous backup" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/certbot/certbot-constants.sh"
    case "$SUBCHOICE" in
        "Install" )
            source "$SCRIPTPATH/utils/certbot/certbot-installer.sh" ;;
        "Uninstall" )
            source "$SCRIPTPATH/utils/certbot/certbot-uninstaller.sh" ;;
        "Backup" )
            APPNAME='certbot'
            APPTITLE
            source "$SCRIPTPATH/inc/app-backup-controller.sh" ;;
        "Restore" )
            APPNAME='certbot'
            source "$SCRIPTPATH/inc/app-restore-controller.sh" ;;
        "Go Back" )
            source "$SCRIPTPATH/utils/utils-menu.sh" ;;
        *)
            source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 1
fi
