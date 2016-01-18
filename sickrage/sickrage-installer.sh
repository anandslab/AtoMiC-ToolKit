#!/bin/bash
# Script Name: AtoMiC SickRage Installer
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

echo -e $GREEN'AtoMiC SickRage Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install git-core python python-cheetah

echo
sleep 1

echo -e $YELLOW'--->Checking for previous versions of SickRage...'$ENDCOLOR
sleep 1
sudo /etc/init.d/sickrage stop >/dev/null 2>&1
echo -e 'Any running SickRage processes stopped'
sleep 1
sudo update-rc.d -f sickrage remove >/dev/null 2>&1
sudo rm /etc/init.d/sickrage >/dev/null 2>&1
sudo rm /etc/default/sickrage >/dev/null 2>&1
echo -e 'Any existing SickRage init scripts removed'
sleep 1
sudo update-rc.d -f sickrage remove >/dev/null 2>&1
if [ -d "/home/$UNAME/.sickrage" ]; then
	mv /home/$UNAME/.sickrage /home/$UNAME/.sickrage_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	echo -e 'Existing SickRage files were moved to '$CYAN'/home/'$UNAME'/.sickrage_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous SickRage folder found'
fi

echo
sleep 1

echo -e $YELLOW'--->Downloading latest SickRage...'$ENDCOLOR
cd /home/$UNAME
git clone https://github.com/SiCKRAGETV/SickRage.git /home/$UNAME/.sickrage || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }
sudo chown -R $UNAME:$UGROUP /home/$UNAME/.sickrage >/dev/null 2>&1
sudo chmod 775 -R /home/$UNAME/.sickrage >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Installing SickRage...'$ENDCOLOR
cd /home/$UNAME/.sickrage
# Check to see if autoProcessTV.cfg.sample exists https://github.com/htpcBeginner/AtoMiC-ToolKit/issues/29
if [ -f "autoProcessTV/autoProcessTV.cfg.sample" ]; then
 cp -a autoProcessTV/autoProcessTV.cfg.sample autoProcessTV/autoProcessTV.cfg || { echo -e $RED'Could not copy autoProcess.cfg.'$ENDCOLOR ; exit 1; }
fi

echo
sleep 1

echo -e $YELLOW'--->Configuring SickRage Install...'$ENDCOLOR
echo "# COPY THIS FILE TO /etc/default/sickrage" >> $SCRIPTPATH/tmp/sickrage_default || { echo -e $RED'Could not create default file.'$ENDCOLOR ; exit 1; }
echo "SR_HOME=/home/"$UNAME"/.sickrage/" >> $SCRIPTPATH/tmp/sickrage_default
echo "SR_DATA=/home/"$UNAME"/.sickrage/" >> $SCRIPTPATH/tmp/sickrage_default
echo -e 'Enabling user'$CYAN $UNAME $ENDCOLOR'to run SickRage...'
echo "SR_USER="$UNAME >> $SCRIPTPATH/tmp/sickrage_default
sudo mv $SCRIPTPATH/tmp/sickrage_default /etc/default/sickrage

echo
sleep 1

echo -e $YELLOW'--->Enabling SickRage AutoStart at Boot...'$ENDCOLOR
sudo cp runscripts/init.ubuntu /etc/init.d/sickrage || { echo -e $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME:$UGROUP /etc/init.d/sickrage
sudo chmod +x /etc/init.d/sickrage
sudo update-rc.d sickrage defaults

echo
sleep 1

echo -e $YELLOW'--->Creating Run Directories...'$ENDCOLOR

sudo mkdir /var/run/sickrage >/dev/null 2>&1
sudo chown $UNAME:$UGROUP /var/run/sickrage >/dev/null 2>&1

echo
sleep 1

echo -e 'Stashing any changes made to SickRage...'
cd /home/$UNAME/.sickrage
source $SCRIPTPATH/inc/gitstash.sh

echo
sleep 1
/etc/init.d/sickrage start

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'SickRage should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/sickrage start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8081'$ENDCOLOR' in your browser.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
