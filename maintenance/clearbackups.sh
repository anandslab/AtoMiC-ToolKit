#!/bin/bash
# shellcheck disable=SC1090
# Script Name: AtoMiC ToolKit Backups Cleaner
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"

echo -e $GREEN'AtoMiC ToolKit Backups Cleaner'$ENDCOLOR

echo

target=$SCRIPTPATH/backups/
if find "$target" -mindepth 1 -print -quit | grep -q .; then
    echo -e $YELLOW'--->Below are the backups folder contents...'$ENDCOLOR
    ls -l $SCRIPTPATH/backups/*

    echo
    sleep 1

    echo -e $GREEN'Delete all backups?'$ENDCOLOR
    echo -e 'Triple check. You will not be able to restore if you delete backups.'
    read -p 'Type y/Y and press [ENTER] to delete or any other key to exit: '
    RESP=${REPLY,,}

    echo

    if [[ $RESP == "y" ]]; then
        echo -e "$YELLOW--->Deleting all backups...$ENDCOLOR"
        rm $SCRIPTPATH/backups/* >/dev/null 2>&1
        if find "$target" -mindepth 1 -print -quit | grep -q .; then
            echo -e "${RED}Deleting backups failed.$ENDCOLOR"
        else
            echo 'All backups deleted successfully.'
        fi
    else
        echo -e "${RED}Backups not deleted.$ENDCOLOR"
    fi
else
    echo -e "${RED}There are no backups to delete.$ENDCOLOR"
fi

source "$SCRIPTPATH/inc/exit.sh"
