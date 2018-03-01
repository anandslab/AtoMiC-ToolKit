#!/bin/bash
# Script Name: AtoMiC ToolKit Temporary Data Cleaner
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"

echo -e $GREEN'AtoMiC ToolKit Temporary Data Cleaner'$ENDCOLOR

echo

target=$SCRIPTPATH/tmp/
if find "$target" -mindepth 1 -print -quit | grep -q .; then
    echo -e $YELLOW'--->Below are the tmp folder contents...'$ENDCOLOR
    ls -l $SCRIPTPATH/tmp/*

    echo
    sleep 1

    echo -e $GREEN'Delete all temporary data?'$ENDCOLOR
    echo -e 'Temporary data can be safely deleted and recreated.'
    read -r -p'Type y/Y and press [ENTER] to delete or any other key to exit: '
    RESP=${REPLY,,}

    echo

    if [[ $RESP == "y" ]]; then
        echo -e "$YELLOW--->Deleting all temporary...$ENDCOLOR"
        rm $SCRIPTPATH/tmp/* >/dev/null 2>&1
        if find "$target" -mindepth 1 -print -quit | grep -q .; then
            echo -e "${RED}Deleting temporary data failed.$ENDCOLOR"
        else
            echo -e 'All temporary data deleted successfully.'
        fi
    else
        echo -e "${RED}Temporary data not deleted.$ENDCOLOR"
    fi
else
    echo -e "${RED}There are no temporary data to delete.$ENDCOLOR"
fi

source "$SCRIPTPATH/inc/exit.sh"
