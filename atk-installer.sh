#!/bin/bash
# Script Name: AtoMiC ToolKit One-Step Installer
# Author: htpcBeginner
# Credit: Modified from the original script by @jknight2014 of KnightCinema
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

YELLOW='\e[93m'
RED='\e[91m'
ENDCOLOR='\033[0m'
CYAN='\e[96m'
GREEN='\e[92m'

echo -e $YELLOW'--->Creating AtoMiC ToolKit Install Log...'$ENDCOLOR
touch /var/log/atomic-install.log
echo -e 'Log created: '$CYAN'/var/log/atomic-install.log'$ENDCOLOR

sleep 1
echo

echo -e $YELLOW'--->Updating APT ...'$ENDCOLOR
apt-get -y update > /var/log/atomic-install.log

sleep 1
echo

echo -e $YELLOW'--->Installing Prerequisites...'$ENDCOLOR
apt-get -y install git-core nano python-software-properties > /var/log/atomic-install.log

sleep 1
echo

#Cloaning into the OPT folder for organization.
echo -e $YELLOW'--->Downloading AtoMiC-ToolKit /opt folder...'$ENDCOLOR
git clone https://github.com/htpcBeginner/AtoMiC-ToolKit.git /opt/AtoMiC-ToolKit > /var/log/atomic-install.log

sleep 1
echo

#Creating a sym link to the user bin so the toolkit can be accessed by typing atk.
echo -e $YELLOW'--->Installing AtoMiC-ToolKit...'$ENDCOLOR
ln -s -T /opt/AtoMiC-ToolKit/setup.sh /usr/local/bin/atk > /var/log/atomic-install.log

sleep 1
echo

echo -e $GREEN'Install Finished.'$ENDCOLOR
echo -e 'You can use the AtoMiC-ToolKit by typing '$CYAN'atk'$ENDCOLOR' anytime.'
echo -e $YELLOW'--->Starting the AtoMiC-ToolKit now...'$ENDCOLOR
sleep 5
rm /tmp/atomicinstaller.sh
atk
