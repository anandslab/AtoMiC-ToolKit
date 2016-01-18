#!/bin/bash
# Script Name: AtoMiC Sick Beard Installer
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

echo -e $GREEN'AtoMiC Sick Beard Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh

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
echo -e 'Any existing SickBeard init scripts removed'
sleep 1
sudo update-rc.d -f sickbeard remove >/dev/null 2>&1
if [ -d "/home/$UNAME/.sickbeard" ]; then
	mv /home/$UNAME/.sickbeard /home/$UNAME/.sickbeard_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	echo -e 'Existing SickBeard files were moved to '$CYAN'/home/'$UNAME'/.sickbeard_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous SickBeard folder found'
fi

echo
sleep 1

echo -e $YELLOW'--->Downloading latest SickBeard...'$ENDCOLOR
cd /home/$UNAME
git clone https://github.com/midgetspy/Sick-Beard.git .sickbeard || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }
sudo chown -R $UNAME:$UGROUP /home/$UNAME/.sickbeard >/dev/null 2>&1
sudo chmod 775 -R /home/$UNAME/.sickbeard >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Installing SickBeard...'$ENDCOLOR
cd /home/$UNAME/.sickbeard
cp -a autoProcessTV/autoProcessTV.cfg.sample autoProcessTV/autoProcessTV.cfg || { echo -e $RED'Could not copy autoProcess.cfg.'$ENDCOLOR ; exit 1; }

echo
sleep 1

echo -e $YELLOW'--->Configuring SickBeard Install...'$ENDCOLOR
echo "# COPY THIS FILE TO /etc/default/sickbeard" >> $SCRIPTPATH/tmp/sickbeard_default || { echo -e $RED'Could not create default file.'$ENDCOLOR ; exit 1; }
echo "SB_HOME=/home/"$UNAME"/.sickbeard/" >> $SCRIPTPATH/tmp/sickbeard_default
echo "SB_DATA=/home/"$UNAME"/.sickbeard/" >> $SCRIPTPATH/tmp/sickbeard_default
echo -e 'Enabling user'$CYAN $UNAME $ENDCOLOR'to run SickBeard...'
echo "SB_USER="$UNAME >> $SCRIPTPATH/tmp/sickbeard_default
sudo mv $SCRIPTPATH/tmp/sickbeard_default /etc/default/sickbeard

echo
sleep 1

echo -e $YELLOW'--->Enabling SickBeard AutoStart at Boot...'$ENDCOLOR
sudo cp init.ubuntu /etc/init.d/sickbeard || { echo -e $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME:$UGROUP /etc/init.d/sickbeard
sudo chmod +x /etc/init.d/sickbeard
sudo update-rc.d sickbeard defaults

echo
sleep 1

echo -e $YELLOW'--->Creating Run Directories...'$ENDCOLOR
sudo mkdir /var/run/sickbeard >/dev/null 2>&1
sudo chown $UNAME:$UGROUP /var/run/sickbeard >/dev/null 2>&1

echo
sleep 1

echo -e 'Stashing any changes made to Sick Beard...'
cd /home/$UNAME/.sickbeard
source $SCRIPTPATH/inc/gitstash.sh

echo
sleep 1
/etc/init.d/sickbeard start

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'SickBeard should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/sickbeard start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8081'$ENDCOLOR' in your browser.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
