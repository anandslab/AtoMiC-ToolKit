#!/bin/bash
# Script Name: AtoMiC headphones Installer
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

echo -e $GREEN'AtoMiC Headphones Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install git-core python

echo
sleep 1

echo -e $YELLOW'--->Checking for previous versions of headphones...'$ENDCOLOR
sleep 1
sudo /etc/init.d/headphones stop >/dev/null 2>&1
echo -e 'Any running headphones processes stopped'
sleep 1
sudo update-rc.d -f headphones remove >/dev/null 2>&1
sudo rm /etc/init.d/headphones >/dev/null 2>&1
sudo rm /etc/default/headphones >/dev/null 2>&1
echo -e 'Any existing headphones init scripts removed'
sleep 1
sudo update-rc.d -f headphones remove >/dev/null 2>&1
if [ -d "/home/$UNAME/.headphones" ]; then
	mv /home/$UNAME/.headphones /home/$UNAME/.headphones_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	echo -e 'Existing headphones files were moved to '$CYAN'/home/'$UNAME'/.headphones_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous Headphones folder found'
fi

echo
sleep 1

echo -e $YELLOW'--->Downloading latest headphones...'$ENDCOLOR
cd /home/$UNAME
git clone https://github.com/rembo10/headphones.git /home/$UNAME/.headphones || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }
sudo chown -R $UNAME:$UGROUP /home/$UNAME/.headphones >/dev/null 2>&1
sudo chmod 775 -R /home/$UNAME/.headphones >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Configuring headphones Install...'$ENDCOLOR
echo "# COPY THIS FILE TO /etc/default/headphones" >> $SCRIPTPATH/tmp/headphones_default || { echo 'Could not create default file.' ; exit 1; }
echo "# OPTIONS: HP_HOME, HP_USER, HP_DATA, HP_PIDFILE, PYTHON_BIN, HP_OPTS, SSD_OPTS" >> $SCRIPTPATH/tmp/headphones_default
echo "HP_HOME=/home/"$UNAME"/.headphones/" >> $SCRIPTPATH/tmp/headphones_default
echo "HP_DATA=/home/"$UNAME"/.headphones/" >> $SCRIPTPATH/tmp/headphones_default
echo 'HP_OPTS=" --config=/home/'$UNAME'/.headphones/config.ini"' >> $SCRIPTPATH/tmp/headphones_default

echo -e 'Enabling user'$CYAN $UNAME $ENDCOLOR'to run headphones...'
echo "HP_USER="$UNAME >> $SCRIPTPATH/tmp/headphones_default
sudo mv $SCRIPTPATH/tmp/headphones_default /etc/default/

echo
sleep 1

echo -e $YELLOW'--->Enabling headphones AutoStart at Boot...'$ENDCOLOR
sudo cp /home/$UNAME/.headphones/init-scripts/init.ubuntu /etc/init.d/headphones || { echo $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME:$UGROUP /etc/init.d/headphones
sudo chmod +x /etc/init.d/headphones
sudo update-rc.d headphones defaults

echo
sleep 1

echo -e $YELLOW'--->Stashing any changes made to headphones...'$ENDCOLOR
cd /home/$UNAME/.headphones
source $SCRIPTPATH/inc/gitstash.sh

echo
sleep 1

echo -e $YELLOW'--->Starting headphones'$ENDCOLOR
/etc/init.d/headphones start >/dev/null 2>&1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'headphones should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/headphones start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8181'$ENDCOLOR' in your browser.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
