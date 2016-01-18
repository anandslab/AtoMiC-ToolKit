#!/bin/bash
# Script Name: AtoMiC CouchPotato Installer
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $1 != *"setup.sh"* ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi

source $2/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN'AtoMiC CouchPotato Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install git-core python python-cheetah

echo
sleep 1

echo -e $YELLOW'--->Checking for previous versions of CouchPotato...'$ENDCOLOR
sleep 1
sudo /etc/init.d/couchpotato stop >/dev/null 2>&1
echo -e 'Any running CouchPotato processes stopped'
sleep 1
sudo update-rc.d -f couchpotato remove >/dev/null 2>&1
sudo rm /etc/init.d/couchpotato >/dev/null 2>&1
sudo rm /etc/default/couchpotato >/dev/null 2>&1
echo -e 'Any existing CouchPotato init scripts removed'
sleep 1
sudo update-rc.d -f couchpotato remove >/dev/null 2>&1
if [ -d "/home/$UNAME/.couchpotato" ]; then
	mv /home/$UNAME/.couchpotato /home/$UNAME/.couchpotato_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	echo -e 'Existing CouchPotato files were moved to '$CYAN'/home/'$UNAME'/.couchpotato_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous CouchPotato folder found'
fi

echo
sleep 1

echo -e $YELLOW'--->Downloading latest CouchPotato...'$ENDCOLOR
cd /home/$UNAME
git clone https://github.com/RuudBurger/CouchPotatoServer.git /home/$UNAME/.couchpotato || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }
sudo chown -R $UNAME:$UGROUP /home/$UNAME/.couchpotato >/dev/null 2>&1
sudo chmod 775 -R /home/$UNAME/.couchpotato >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Configuring CouchPotato Install...'$ENDCOLOR
echo "# COPY THIS FILE TO /etc/default/couchpotato" >> $SCRIPTPATH/tmp/couchpotato_default || { echo 'Could not create default file.' ; exit 1; }
echo "# OPTIONS: CP_HOME, CP_USER, CP_DATA, CP_PIDFILE, PYTHON_BIN, CP_OPTS, SSD_OPTS" >> $SCRIPTPATH/tmp/couchpotato_default
echo "CP_HOME=/home/"$UNAME"/.couchpotato/" >> $SCRIPTPATH/tmp/couchpotato_default
echo "CP_DATA=/home/"$UNAME"/.couchpotato/" >> $SCRIPTPATH/tmp/couchpotato_default

echo -e 'Enabling user'$CYAN $UNAME $ENDCOLOR'to run CouchPotato...'
echo "CP_USER="$UNAME >> $SCRIPTPATH/tmp/couchpotato_default
sudo mv $SCRIPTPATH/tmp/couchpotato_default /etc/default/

echo
sleep 1

echo -e $YELLOW'--->Enabling CouchPotato AutoStart at Boot...'$ENDCOLOR
sudo cp /home/$UNAME/.couchpotato/init/ubuntu /etc/init.d/couchpotato || { echo $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME:$UGROUP /etc/init.d/couchpotato
sudo chmod +x /etc/init.d/couchpotato
sudo update-rc.d couchpotato defaults

echo
sleep 1

echo -e 'Stashing any changes made to CouchPotato...'
cd /home/$UNAME/.couchpotato
source $SCRIPTPATH/inc/gitstash.sh

echo
sleep 1

echo -e 'Starting CouchPotato'
/etc/init.d/couchpotato start >/dev/null 2>&1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'CouchPotato should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/couchpotato start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:5050'$ENDCOLOR' in your browser.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
