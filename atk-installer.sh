#!/bin/bash
# Script Name: AtoMiC ToolKit One-Step Installer
# Author: htpcBeginner
# Credit: Modified from the original script by @jknight2014 of KnightCinema
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# To auto-download and run this installer use the following command:
# wget -q -O - https://git.io/vMNYu | sudo sh

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

echo
echo '--->Creating AtoMiC ToolKit Install Log...'
touch /var/log/atomic-install.log
echo 'Log created in /var/log/atomic-install.log'

echo
sleep 1

echo '--->Updating APT ...'
sudo apt-get -y update > /var/log/atomic-install.log

echo
sleep 1

echo '--->Installing Prerequisites...'
sudo apt-get -y install git-core nano python-software-properties > /var/log/atomic-install.log

echo
sleep 1

#Cloaning into the OPT folder for organization.
echo '--->Downloading AtoMiC-ToolKit /opt folder...'
git clone https://github.com/htpcBeginner/AtoMiC-ToolKit.git /opt/AtoMiC-ToolKit > /var/log/atomic-install.log

echo
sleep 1

#Creating a sym link to the user bin so the toolkit can be accessed by typing atk.
echo '--->Installing AtoMiC-ToolKit...'
sudo ln -s -T /opt/AtoMiC-ToolKit/setup.sh /usr/local/bin/atk > /var/log/atomic-install.log
echo 'Install Finished.'
echo 'You can use the AtoMiC-ToolKit by typing atk anytime.'

echo
sleep 1

echo '--->Starting AtoMiC-ToolKit now...'
#rm /tmp/atk-installer.sh
sleep 5
sudo atk
