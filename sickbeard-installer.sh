#!/bin/bash
# Script Name: AtoMiC Sick Beard installer
# Author: htpcBeginner.com
# Publisher: http://www.htpcBeginner.com
# Version: 1.0 (October 03, 2013) - Initial Release
# Version: 2.0 (April 13, 2014) - Update script to work with Trusty Tahr
# Version: 3.0 (March 14, 2015) - Improved code and user friendliness
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
YELLOW='\e[93m'
RED='\e[91m'
ENDCOLOR='\033[0m'
CYAN='\e[96m'
GREEN='\e[92m'
SCRIPTPATH=$(pwd)

function pause(){
   read -p "$*"
}

clear
echo 
echo -e $RED
echo -e " ┬ ┬┬ ┬┬ ┬ ┬ ┬┌┬┐┌─┐┌─┐┌┐ ┌─┐┌─┐┬┌┐┌┌┐┌┌─┐┬─┐ ┌─┐┌─┐┌┬┐"
echo -e " │││││││││ ├─┤ │ ├─┘│  ├┴┐├┤ │ ┬│││││││├┤ ├┬┘ │  │ ││││"
echo -e " └┴┘└┴┘└┴┘o┴ ┴ ┴ ┴  └─┘└─┘└─┘└─┘┴┘└┘┘└┘└─┘┴└─o└─┘└─┘┴ ┴"
echo -e $CYAN
echo -e "                __     __           "
echo -e "  /\ |_ _ |\/|./      (_  _ _. _ |_ "
echo -e " /--\|_(_)|  ||\__    __)(_| ||_)|_ "
echo -e "                              |     "
echo -e $GREEN'AtoMiC Sick Beard Installer Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->Sick Beard installation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, www.htpcBeginner.com or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to install any relevant packages required to install and configure SickBeard.'
echo -e '5. Best used on a clean system (with no previous SickBeard install) or after complete removal of previous SickBeard installation.'

echo

read -p 'Type y/Y and press [ENTER] to AGREE and continue with the installation or any other key to exit: '
RESP=${REPLY,,}

if [ "$RESP" != "y" ] 
then
	echo -e $RED'So you chickened out. May be you will try again later.'$ENDCOLOR
	echo
	exit 0
fi

echo 

echo -n 'Type the username of the user you want to run Sick Beard as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME

if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
  echo -e $RED'Bummer! You may not have entered your username correctly. Exiting now. Please rerun script.'$ENDCOLOR
  echo
  exit 0
fi

echo

echo -e $YELLOW'--->Refreshing packages list...'$ENDCOLOR
sudo apt-get update

echo
sleep 1

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install git-core python python-cheetah

echo
sleep 1

echo -e $YELLOW'--->Checking for previous versions of SickBeard...'$ENDCOLOR
sleep 1
sudo /etc/init.d/sickbeard stop >/dev/null 2>&1
echo -e 'Any running SickBeard processes stopped'
sleep 1
sudo update-rc.d -f sickbeard remove >/dev/null 2>&1
sudo rm /etc/init.d/sickbeard >/dev/null 2>&1
sudo rm /etc/default/sickbeard >/dev/null 2>&1
echo -e 'Existing SickBeard init scripts removed'
sleep 1
sudo update-rc.d -f sickbeard remove >/dev/null 2>&1
mv /home/$UNAME/.sickbeard /home/$UNAME/.sickbeard_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
echo -e 'Any existing SickBeard files were moved to '$CYAN'/home/'$UNAME'/.sickbeard_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR

echo
sleep 1

echo -e $YELLOW'--->Downloading latest SickBeard...'$ENDCOLOR
cd /home/$UNAME
git clone https://github.com/midgetspy/Sick-Beard.git .sickbeard || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }
chmod 775 -R /home/$UNAME/.sickbeard >/dev/null 2>&1
sudo chown $UNAME: /home/$UNAME/.sickbeard >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Installing SickBeard...'$ENDCOLOR
cd /home/$UNAME/.sickbeard
cp -a autoProcessTV/autoProcessTV.cfg.sample autoProcessTV/autoProcessTV.cfg || { echo -e $RED'Could not copy autoProcess.cfg.'$ENDCOLOR ; exit 1; }

echo
sleep 1

echo -e $YELLOW'--->Configuring SickBeard Install...'$ENDCOLOR
echo "# COPY THIS FILE TO /etc/default/sickbeard" >> sickbeard_default || { echo -e $RED'Could not create default file.'$ENDCOLOR ; exit 1; }
echo "SB_HOME=/home/"$UNAME"/.sickbeard/" >> sickbeard_default
echo "SB_DATA=/home/"$UNAME"/.sickbeard/" >> sickbeard_default
echo -e 'Enabling user'$CYAN $UNAME $ENDCOLOR'to run SickBeard...'
echo "SB_USER="$UNAME >> sickbeard_default
sudo mv sickbeard_default /etc/default/sickbeard
sudo chmod +x /etc/default/sickbeard

echo
sleep 1

echo -e $YELLOW'--->Enabling SickBeard AutoStart at Boot...'$ENDCOLOR
sudo cp init.ubuntu /etc/init.d/sickbeard || { echo -e $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME: /etc/init.d/sickbeard
sudo chmod +x /etc/init.d/sickbeard
sudo update-rc.d sickbeard defaults

echo
sleep 1

echo -e $YELLOW'--->Creating Run Directories...'$ENDCOLOR
sudo mkdir /var/run/sickbeard >/dev/null 2>&1
sudo chown $UNAME: /var/run/sickbeard >/dev/null 2>&1

echo
sleep 1
/etc/init.d/sickbeard start

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'SickBeard should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/sickbeard start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8081'$ENDCOLOR' in your browser.'
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC Sick Beard install script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo ./setup.sh
