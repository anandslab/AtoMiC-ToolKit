#!/bin/bash
# Script Name: AtoMiC Ombi Installer
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo
echo -e $YELLOW'--->Latest File Found...'$ENDCOLOR
OUTPUT="$(curl -s https://api.github.com/repos/tidusjar/Ombi/releases| grep browser_download_url | head -n 1 | cut -d '"' -f 4)"
echo "${OUTPUT}"
echo
echo -e $YELLOW'--->Downloading files...'$ENDCOLOR
sudo rm -rf /tmp/ombidownload
sudo wget -P /tmp/ombidownload "${OUTPUT}"
echo -e $YELLOW'--->Extracting files...'$ENDCOLOR
unzip -j /tmp/ombidownload/*.zip -d /tmp/ombidownload/extract
sudo mv /tmp/ombidownload/extract/Release/* $APPPATH
