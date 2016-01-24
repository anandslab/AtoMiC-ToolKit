#!/bin/bash
# Script Name: AtoMiC Plex Installer
# Author: carrigan98
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
source $SCRIPTPATH/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN'AtoMiC Plex Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh

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

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
