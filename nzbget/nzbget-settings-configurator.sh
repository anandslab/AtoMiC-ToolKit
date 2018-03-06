#!/bin/bash
# Script Name: AtoMiC NZBGet settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo
echo -e "$YELLOW--->Configuring NZBGet Settings...$ENDCOLOR"

#Set Main folder destination
if sudo sed -i 's@^MainDir=.*@MainDir=~/Downloads/nzbget@' "$APPSETTINGS" || \
        { echo -e "${RED}Modifying MainDir location in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }; then
    echo "Modifed MainDir location in $APPSETTINGS file"
fi

#Set LogFile destination
if sudo sed -i 's@^LogFile=.*@LogFile=/var/log/nzbget/nzbget.log@' "$APPSETTINGS" || \
        { echo -e "${RED}Modifying LogFile location in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }; then
    echo "Modifed LogFile location in $APPSETTINGS file"
fi

#Set LockFile destination
if sudo sed -i "s@^LockFile=.*@LockFile=$PID_FILE@" "$APPSETTINGS" || \
        { echo -e "${RED}Modifying LockFile location in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }; then
    echo "Modifed LockFile location in $APPSETTINGS file"
fi
