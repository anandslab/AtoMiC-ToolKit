#!/bin/bash
# Script Name: AtoMiC NZBGet settings configurator
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

echo -e "$YELLOW--->Configuring NZBGet Settings...$ENDCOLOR"

#Set Main folder destination
sudo sed -i 's@MainDir=${AppDir}/downloads@MainDir=~/Downloads/nzbget@g' $APPSETTINGS || { echo -e "${RED}Modifying MainDir location in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }

#Set LogFile destination
sudo sed -i 's@LogFile=${MainDir}/nzbget.log@LogFile=/var/log/nzbget/nzbget.log@g' $APPSETTINGS || { echo -e "${RED}Modifying LogFile location in $APPSETTINGS file failed.$ENDCOLOR"; exit 1; }
