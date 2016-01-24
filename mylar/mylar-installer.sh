#!/bin/bash
# Script Name: AtoMiC Mylar Installer
# Author: PREngineer
# Publisher: http://www.htpcbeginner.com
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

echo -e $GREEN'AtoMiC Mylar Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install git-core python python-cheetah python-cherrypy git

echo
sleep 1

echo -e $YELLOW'--->Checking for previous versions of Mylar...'$ENDCOLOR
sleep 1
sudo /etc/init.d/mylar stop >/dev/null 2>&1
echo -e 'Any running Mylar processes stopped'
sleep 1
sudo update-rc.d -f mylar remove >/dev/null 2>&1
sudo rm /etc/init.d/mylar >/dev/null 2>&1
sudo rm /etc/default/mylar >/dev/null 2>&1
echo -e 'Any existing Mylar init scripts removed'
sleep 1
sudo update-rc.d -f mylar remove >/dev/null 2>&1
if [ -d "/home/$UNAME/.mylar" ]; then
        mv /home/$UNAME/.mylar /home/$UNAME/.mylar_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
        echo -e 'Existing Mylar files were moved to '$CYAN'/home/'$UNAME'/.mylar_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous Mylar folder found'
fi

echo
sleep 1

echo -e $YELLOW'--->Downloading latest Mylar...'$ENDCOLOR
cd /home/$UNAME
git clone https://github.com/evilhero/mylar /home/$UNAME/.mylar || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }
sudo chown -R $UNAME:$UGROUP /home/$UNAME/.mylar >/dev/null 2>&1
sudo chmod 775 -R /home/$UNAME/.mylar >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Configuring Mylar Install...'$ENDCOLOR
echo "# COPY THIS FILE TO /etc/default/mylar" >> $SCRIPTPATH/tmp/mylar || { echo 'Could not create default file.' ; exit 1; }
echo "# OPTIONS: MYLAR_HOME, MYLAR_USER, MYLAR_DATA, MYLAR_PIDFILE, PYTHON_BIN, MYLAR_OPTS, SSD_OPTS" >> mylar
echo "MYLAR_HOME=/home/"$UNAME"/.mylar/" >> $SCRIPTPATH/tmp/mylar
echo "MYLAR_DATA=/home/"$UNAME"/.mylar/" >> $SCRIPTPATH/tmp/mylar
echo "MYLAR_PORT=8090" >> $SCRIPTPATH/tmp/mylar

echo -e 'Enabling user'$CYAN $UNAME $ENDCOLOR'to run Mylar...'
echo "MYLAR_USER="$UNAME >> $SCRIPTPATH/tmp/mylar
sudo mv $SCRIPTPATH/tmp/mylar /etc/default/

echo
sleep 1

echo -e $YELLOW'--->Enabling Mylar AutoStart at Boot...'$ENDCOLOR
sudo cp /home/$UNAME/.mylar/init-scripts/ubuntu.init.d /etc/init.d/mylar || { echo $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME:$UGROUP /etc/init.d/mylar
sudo chmod +x /etc/init.d/mylar
sudo update-rc.d mylar defaults

echo
sleep 1

echo -e $YELLOW'--->Stashing any changes made to Mylar...'$ENDCOLOR
cd /home/$UNAME/.mylar
source $SCRIPTPATH/inc/gitstash.sh

echo
sleep 1

echo -e $YELLOW'--->Starting Mylar'$ENDCOLOR
/etc/init.d/mylar start >/dev/null 2>&1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'Mylar should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/mylar start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8090'$ENDCOLOR' in your browser.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
