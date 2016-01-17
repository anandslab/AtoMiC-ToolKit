#!/bin/bash
# Script Name: AtoMiC Plex Installer
# Author: carrigan98
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
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
echo -e "                __  ___             "
echo -e "  /\ |_ _ |\/|./     | _  _ ||_/.|_ "
echo -e " /--\|_(_)|  ||\__   |(_)(_)|| \||_ "
echo
echo -e $GREEN'AtoMiC Plex Installer Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->Plex installation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to install any relevant packages required to install and configure Plex.'
echo -e '5. Best used on a clean system (with no previous Plex install) or after complete removal of previous Plex installation.'

echo

read -p 'Type y/Y and press [ENTER] to AGREE and continue with the installation or any other key to exit: '
RESP=${REPLY,,}

if [ "$RESP" != "y" ] 
then
	echo -e $RED'So you chickened out. May be you will try again later.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	sudo bash setup.sh
	exit 0
fi

echo

echo -n 'Type the username of the user you want to run Plex Media Server as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME

if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
        echo -e $RED'Bummer! You may not have entered your username correctly. Exiting now. Please rerun script.'$ENDCOLOR
        echo
        pause 'Press [Enter] key to continue...'
        cd $SCRIPTPATH
        sudo bash setup.sh
        exit 0
fi
UGROUP=($(id -gn $UNAME))

echo

echo -e $YELLOW'--->Refreshing packages list...'$ENDCOLOR
sudo apt-get update

echo
sleep 1

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install git-core

echo
sleep 1

echo -e $YELLOW'--->Checking for previous versions of Plex...'$ENDCOLOR
sleep 1
sudo service plexmediaserver stop >/dev/null 2>&1
echo -e 'Any running Plex Media Server processes stopped'
sleep 1
sudo update-rc.d -f plexmediaserver remove >/dev/null 2>&1
sudo rm /etc/init.d/plexmediaserver >/dev/null 2>&1
sudo rm /etc/default/plexmediaserver >/dev/null 2>&1
echo -e 'Any existing Plex init scripts removed'
sleep 1
sudo update-rc.d -f plexmediaserver remove >/dev/null 2>&1
if [ -d "/home/$UNAME/.plexupdate" ]; then
        sudo mv /home/$UNAME/.plexupdate /home/$UNAME/.plexupdate_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
        echo -e 'Existing Plex Config files were moved to '$CYAN'/home/'$UNAME'/.plexupdate_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous .plexupdate folder found'
fi
if [ -d "/home/$UNAME/plexupdate" ]; then
        sudo mv /home/$UNAME/plexupdate /home/$UNAME/plexupdate_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
        echo -e 'Existing PlexUpdate folder was moved to '$CYAN'/home/'$UNAME'/plexupdate_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous plexupdate folder found'
fi

echo -e $YELLOW'--->Downloading plexupdate...'$ENDCOLOR
cd /home/$UNAME
git clone https://github.com/mrworf/plexupdate.git /home/$UNAME/plexupdate || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }

echo
sleep 1

echo -e $YELLOW'--->Creating config file...'$ENDCOLOR
sudo mkdir -p /tmp/plex
echo '# COPY THIS FILE TO ~/.plexupdate' >> /home/$UNAME/.plexupdate || { echo 'Could not create config file.' ; exit 1; }
echo 'EMAIL='                           >> /home/$UNAME/.plexupdate
echo 'PASS='                            >> /home/$UNAME/.plexupdate
echo 'DOWNLOADDIR="/tmp/plex"'          >> /home/$UNAME/.plexupdate
echo 'KEEP=no'                          >> /home/$UNAME/.plexupdate
echo 'FORCE=no'                         >> /home/$UNAME/.plexupdate
echo 'PUBLIC=yes'                       >> /home/$UNAME/.plexupdate
echo 'AUTOINSTALL=yes'                  >> /home/$UNAME/.plexupdate
echo 'AUTODELETE=yes'                   >> /home/$UNAME/.plexupdate
echo 'AUTOUPDATE=yes'                   >> /home/$UNAME/.plexupdate
echo 'AUTOSTART=yes'                    >> /home/$UNAME/.plexupdate

echo 
sleep 1

echo -e $YELLOW'--->Running plexupdate script...'$ENDCOLOR
sudo bash /home/$UNAME/plexupdate/plexupdate.sh

echo 
sleep 1

clear
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'Plex should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/Musicbrainz start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:32400/manage'$ENDCOLOR' in your browser.'
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC Plex Install script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo bash setup.sh
exit 0