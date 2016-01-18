#!/bin/bash
# Script Name: AtoMiC SickGear Installer
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

echo -e $GREEN'AtoMiC SickGear Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install git-core python python-cheetah

echo
sleep 1

echo -e $YELLOW'--->Checking for previous versions of SickGear...'$ENDCOLOR
sleep 1
sudo /etc/init.d/sickgear stop >/dev/null 2>&1
echo -e 'Any running SickGear processes stopped'
sleep 1
sudo update-rc.d -f sickgear remove >/dev/null 2>&1
sudo rm /etc/init.d/sickgear >/dev/null 2>&1
sudo rm /etc/default/sickgear >/dev/null 2>&1
echo -e 'Any existing SickGear init scripts removed'
sleep 1
sudo update-rc.d -f sickgear remove >/dev/null 2>&1
if [ -d "/home/$UNAME/.sickgear" ]; then
	mv /home/$UNAME/.sickgear /home/$UNAME/.sickrage_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	echo -e 'Existing SickGear files were moved to '$CYAN'/home/'$UNAME'/.sickrage_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous SickGear folder found'
fi

echo
sleep 1

echo -e $YELLOW'--->Downloading latest SickGear...'$ENDCOLOR
cd /home/$UNAME
git clone https://github.com/SickGear/SickGear /home/$UNAME/.sickgear || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }
sudo chown -R $UNAME:$UGROUP /home/$UNAME/.sickgear >/dev/null 2>&1
sudo chmod 775 -R /home/$UNAME/.sickgear >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Installing SickGear...'$ENDCOLOR
cd /home/$UNAME/.sickgear
cp -a autoProcessTV/autoProcessTV.cfg.sample autoProcessTV/autoProcessTV.cfg || { echo -e $RED'Could not copy autoProcess.cfg.'$ENDCOLOR ; exit 1; }

echo
sleep 1

echo -e $YELLOW'--->Configuring SickGear Install...'$ENDCOLOR
echo "# COPY THIS FILE TO /etc/default/sickgear" >> $SCRIPTPATH/tmp/sickrage_default || { echo -e $RED'Could not create default file.'$ENDCOLOR ; exit 1; }
echo "SB_HOME=/home/"$UNAME"/.sickgear/" >> $SCRIPTPATH/tmp/sickrage_default
echo "SB_DATA=/home/"$UNAME"/.sickgear/" >> $SCRIPTPATH/tmp/sickrage_default
echo -e 'Enabling user'$CYAN $UNAME $ENDCOLOR'to run SickGear...'
echo "SB_USER="$UNAME >> $SCRIPTPATH/tmp/sickrage_default
sudo mv $SCRIPTPATH/tmp/sickrage_default /etc/default/sickgear

echo
sleep 1

echo -e $YELLOW'--->Enabling SickGear AutoStart at Boot...'$ENDCOLOR
sudo cp init.ubuntu /etc/init.d/sickgear || { echo -e $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME:$UGROUP /etc/init.d/sickgear
sudo sed -i 's|/etc/default/sickbeard|/etc/default/sickgear|g' /etc/init.d/sickgear || { echo -e $RED'Replacing default path failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's|NAME=sickbeard|NAME=sickgear|g' /etc/init.d/sickgear || { echo -e $RED'Replacing NAME failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's|DESC=SickBeard|DESC=SickGear|g' /etc/init.d/sickgear || { echo -e $RED'Replacing DESC failed.'$ENDCOLOR ; exit 1; }

sudo chmod +x /etc/init.d/sickgear
sudo update-rc.d sickgear defaults

echo
sleep 1

echo -e $YELLOW'--->Creating Run Directories...'$ENDCOLOR

sudo mkdir /var/run/sickgear >/dev/null 2>&1
sudo chown $UNAME:$UGROUP /var/run/sickgear >/dev/null 2>&1

echo
sleep 1

echo -e 'Stashing any changes made to SickGear...'
cd /home/$UNAME/.sickgear
source $SCRIPTPATH/inc/gitstash.sh

echo
sleep 1
/etc/init.d/sickgear start

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'SickGear should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/sickgear start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8081'$ENDCOLOR' in your browser.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
