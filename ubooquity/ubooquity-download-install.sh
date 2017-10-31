#!/bin/bash
# Script Name: AtoMiC Ubooquity Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

cd $(mktemp -d) || exit

echo -e "${YELLOW}--->Downloading files...$ENDCOLOR"
sudo wget "http://vaemendis.net/ubooquity/service/download.php" -O ubooquity.zip

echo -e "${YELLOW}--->Extracting files...$ENDCOLOR"
sudo unzip -qo ubooquity*.zip -d "$APPPATH"
echo 'Done'
cd "$SCRIPTPATH" || exit
