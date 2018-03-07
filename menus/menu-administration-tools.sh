#!/bin/bash
# Script Name: AtoMiC Admin Tools Menu

SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - htpcBeginner.com" \
--menu "Which app would you like to manage?" --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Glances" "Glances an Eye on your system. A top/htop alternative" \
"Grafana" "Open platform for beautiful analytics and monitoring" \
"HTPC Manager" "Unified HTPC Web Interface" \
"Muximux" "A lightweight way to manage your HTPC" \
"NetData" "Real-time performance and health monitoring" \
"Ombi" "Allow your users to Request Movies, TV Shows and Albums" \
"Organizr" "HTPC/Homelab Services Organizer" \
"phpSysInfo" "Display info about your system" \
"Webmin" "Web-based system administration" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/inc/app-constant-reset.sh"
    case "$SUBCHOICE" in
        "Glances" )
            source "$SCRIPTPATH/glances/glances-menu.sh" ;;
        "Grafana" )
            source "$SCRIPTPATH/grafana/grafana-menu.sh" ;;
        "HTPC Manager" )
            source "$SCRIPTPATH/htpcmanager/htpcmanager-menu.sh" ;;
        "Muximux" )
            source "$SCRIPTPATH/muximux/muximux-menu.sh" ;;
        "NetData" )
            source "$SCRIPTPATH/netdata/netdata-menu.sh" ;;
        "Ombi" )
            source "$SCRIPTPATH/ombi/ombi-menu.sh" ;;
        "Organizr" )
            source "$SCRIPTPATH/organizr/organizr-menu.sh" ;;
        "phpSysInfo" )
            source "$SCRIPTPATH/phpsysinfo/phpsysinfo-menu.sh" ;;
        "Webmin" )
            source "$SCRIPTPATH/webmin/webmin-menu.sh" ;;
        "Go Back" )
            source "$SCRIPTPATH/menus/menu-main.sh" ;;
        *)
            source "$SCRIPTPATH/inc/invalid-option.sh" ;;
    esac
else
    source "$SCRIPTPATH/inc/thankyou.sh"
    echo
    sleep 1
    exit 0
fi
