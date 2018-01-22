#!/bin/bash
# shellcheck disable=SC1090
# shellcheck disable=SC2034
source "$SCRIPTPATH/inc/app-setup-check.sh"
SUBCHOICE=$(whiptail --title "AtoMiC Toolkit - Manage Python" \
--menu " Installs https://launchpad.net/~jonathonf python repo to update Python." --backtitle "$BACKTITLE" \
--fb --cancel-button "Exit" $LINES $COLUMNS "$NETLINES" \
"Install/Update" "python 2.7" \
"Update" "All pyton2.7 PIP Packages" \
"Install/Update " "python 3.x" \
"Update " "All pyton3.x PIP Packages" \
"Go Back" "to previous menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [[ $exitstatus = 0 ]]; then
    source "$SCRIPTPATH/utils/python/python-constants.sh"
    case "$SUBCHOICE" in
        "Install/Update" )
            source "$SCRIPTPATH/utils/python/python-installer.sh" ;;
        "Update" )
            source "$SCRIPTPATH/utils/python/python-pip-update.sh" 'pip2' ;;
        "Install/Update " )
            source "$SCRIPTPATH/utils/python/python-installer.sh" 'python3' ;;
        "Update " )
            source "$SCRIPTPATH/utils/python/python-pip-update.sh" 'pip3' ;;
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
