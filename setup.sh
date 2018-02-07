#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC ToolKit
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

# Set caller id and script path
export CALLER=$(ps ax | grep "^ *$PPID" | awk '{print $NF}')
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
export SCRIPTPATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
export ISSETUP="Yes"

source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/app-constant-reset.sh"

# Check if being run as root
if [[ $EUID -ne 0 ]] ; then
    echo
    echo -e "${RED}Please run as root using the command: ${ENDCOLOR}sudo bash setup.sh"
    echo
    exit 0
fi

source "$SCRIPTPATH/inc/header.sh"

# Define help function for options
help(){
    echo
    echo -e "${YELLOW}--->COMMAND LINE OPTIONS:$ENDCOLOR"
    echo
    echo "Usage example:";
    echo "atomic-toolkit [(-i|--install) appname] [(-u|--uninstall) appname] [(-b|--backup) appname] [(-r|--restore) appname] [(-m|--manualupdate) appname] [(-p|--passwordreset) appname] [(-a|--accessdetails) appname] [(-x|--reverseproxy)] [(-t|--updatetoolkit)] [(-U|--updateall)]";
    echo "Options:";
    echo
    echo "-i or --install appname: Install an app.";
    echo "-u or --uninstall appname: Uninstall an app.";
    echo "-b or --backup appname: Backup an the config file for an app.";
    echo "-r or --restore appname: Restore an app config file from backup.";
    echo "-m or --manualupdate appname: Manually update a specific app.";
    echo "-p or --passwordreset appname: Reset the password to an app.";
    echo "-a or --accessdetails appname: View the access details for an app.";
    echo "-x or --reverseproxy appname: Enable Reverse Proxy for an app.";
    echo "-t or --updatetoolkit: Update AtoMiC-ToolKit.";
    echo "-U or --updateall: Update Linux and all apps.";
    exit 1;
}

# Reset option vars
updatetoolkit=0;
updateall=0;

# Capture options to getopts
export ARGS=$(getopt -o "i:u:b:r:m:p:a:x:tUh" -l "install:,uninstall:,backup:,restore:,manualupdate:,passwordreset:,accessdetails:,reverseproxy:,updatetoolkit,updateall,help" -n "AtoMiC-ToolKit" -- "$@");

#sleep 1
#echo $1

if [[ ! -d $SCRIPTPATH/tmp ]]; then
    mkdir "$SCRIPTPATH/tmp"
fi

if [[ ! -d $SCRIPTPATH/backups ]]; then
    mkdir "$SCRIPTPATH/backups"
fi

if [[ -z $CI ]]; then
    echo -e "${YELLOW}--->DISCLAIMERS:$ENDCOLOR"
    if [[ ! -f $SCRIPTPATH/tmp/consented ]]; then
        #echo 'consent file not present'
        source "$SCRIPTPATH/inc/consent.sh"
        source "$SCRIPTPATH/inc/app-toolkit-deps.sh"
    else
        echo -e 'Already agreed. Can be cleared in the next screen.'
    fi
fi

echo
#sleep 1
if [[ -z $CI ]]; then
    echo -e "${YELLOW}--->USER INFORMATION:$ENDCOLOR"
    if [[ ! -f $SCRIPTPATH/tmp/userinfo ]]; then
        #echo 'userinfo not present'
        source "$SCRIPTPATH/inc/usercheck.sh"
    else
        #echo 'userinfo present'
        source "$SCRIPTPATH/tmp/userinfo"
        if [[ -z $UNAME ]] || [[ -z $UGROUP ]]; then
            #echo 'userinfo not complete'
            source "$SCRIPTPATH/inc/usercheck.sh"
        else
            echo -e "Already present: $CYAN$UNAME$ENDCOLOR." \
                    "Can be cleared in the next screen."
            echo
            source "$SCRIPTPATH/inc/option-handler.sh"
        fi
    fi
else
    source "$SCRIPTPATH/tmp/userinfo"
    source "$SCRIPTPATH/inc/option-handler.sh"
fi

# Set permissions for all files
sudo chown -R $UNAME:$UGROUP $SCRIPTPATH >/dev/null 2>&1
sudo chmod -R 775 $SCRIPTPATH >/dev/null 2>&1
sudo chmod -R g+s $SCRIPTPATH >/dev/null 2>&1

if [[ ! -d '/opt' ]]; then
    mkdir /opt
    sudo chown -R $UNAME:$UGROUP /opt >/dev/null 2>&1
    sudo chmod -R 775 /opt >/dev/null 2>&1
    sudo chmod -R g+s /opt >/dev/null 2>&1
    echo -e 'opt dir created.'
fi

#Creating a sym link to the user bin so the toolkit can be accessed by typing atk.
if [[ ! -L "/usr/local/bin/atk" ]]; then
    echo
    echo -e "${YELLOW}--->Installing AtoMiC-ToolKit symbolic link...$ENDCOLOR"
    sudo ln -s -T "$SCRIPTPATH/setup.sh" /usr/local/bin/atk
    echo 'You can use the AtoMiC-ToolKit by typing the following command from anywhere:'
    echo -e "${GREEN}sudo atk$ENDCOLOR"
    echo
fi

if [[ -z $ARGS ]]; then
    source "$SCRIPTPATH/inc/pause.sh"
    source "$SCRIPTPATH/inc/header.sh"
    source "$SCRIPTPATH/menus/menu-main.sh"
fi
