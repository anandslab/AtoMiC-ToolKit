#!/bin/bash
# Script Name: AtoMiC Sick Beard Uninstaller
# Author: htpcBeginner.com
# Publisher: http://www.htpcBeginner.com
# Version: 1.0 (March 23, 2015) - Initial Release
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
echo -e $GREEN'AtoMiC Sick Beard Uninstaller Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->Sick Beard uninstallation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, www.htpcBeginner.com or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to uninstall any relevant files/packages.'
echo -e '5. Best used to uninstall Sick Beard installed using AtoMiC ToolKit or htpcbeginner.com guides.'

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

echo -n 'Type the username of the user you installed SickBeard as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME

if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
  echo -e $RED'Bummer! You may not have entered your username correctly. Exiting now. Please rerun script.'$ENDCOLOR
  echo
  exit 0
fi

echo
sleep 1

echo -e $YELLOW'--->Stopping SickBeard...'$ENDCOLOR
sudo /etc/init.d/sickbeard stop >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Removing SickBeard Autostart scripts...'$ENDCOLOR
sudo update-rc.d -f sickbeard remove || { echo -e $RED'Warning! update-rc.d remove failed.'$ENDCOLOR ; }
sudo rm /etc/default/sickbeard || { echo -e $RED'Warning! Removing default script failed.'$ENDCOLOR ; }
sudo rm /etc/init.d/sickbeard || { echo -e $RED'Warning! Removing init script failed.'$ENDCOLOR ; }

echo
sleep 1

read -p 'You may keep SickBeard installation files as a backup or for reinstalling later. Do you want to keep the files? Type y/Y and press [ENTER]: '
FILEDEL=${REPLY,,}

if [ "$FILEDEL" != "y" ] 
then
	echo
	echo -e $YELLOW'--->Deleting SickBeard files from '$CYAN'/home/'$UNAME'/.sickbeard'$YELLOW'...'$ENDCOLOR
	sudo rm -r /home/$UNAME/.sickbeard
else
	echo
	echo -e $YELLOW'--->Keeping SickBeard files in '$CYAN'/home/'$UNAME'/.sickbeard'$YELLOW'...'$ENDCOLOR
fi

echo
sleep 1

echo -e $GREEN'--->All done. SickBeard Uninstalled.'$ENDCOLOR
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC Sick Beard install script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo ./setup.sh
