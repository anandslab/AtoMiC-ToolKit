#!/bin/bash


SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage OpenVPN" \
--menu "What would you like to do?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install/Update" "OpenVPN via official repository" \
"Uninstall" "OpenVPN and remove official repository" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/openvpn/openvpn-constants.sh"
    case "$SUBCHOICE" in
        "Install/Update" )
            source "$SCRIPTPATH/utils/openvpn/openvpn-installer.sh" ;;
        "Uninstall" )
            source "$SCRIPTPATH/utils/openvpn/openvpn-uninstaller.sh" ;;
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
