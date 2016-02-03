#!/bin/bash
# Script Name: AtoMiC Transmission WebUI Installer
# Author: htpcBeginner
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

echo -e $GREEN'AtoMiC Transmission WebUI Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW"--->Installing prerequisites..."$ENDCOLOR
sudo apt-get -y install python-software-properties

echo
sleep 1

echo -e $YELLOW"--->Adding Transmission repository..."$ENDCOLOR
GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep transmissionbt)
if [ "$GREPOUT" == "" ]; then
    sudo add-apt-repository -y ppa:transmissionbt/ppa
else
    echo "Transmission PPA repository already exists..."
fi

echo
sleep 1

source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW"--->Installing Transmission commandline, and web interface..."$ENDCOLOR
sudo apt-get -y install transmission-cli transmission-common transmission-daemon

echo 
sleep 1

echo -e $YELLOW"--->Stopping Transmission temporarily..."$ENDCOLOR
sudo /etc/init.d/transmission-daemon stop > /dev/null 2>&1 
sleep 2
sudo service transmission-daemon stop > /dev/null 2>&1 
sleep 2
sudo killall transmission-daemon > /dev/null 2>&1 
sleep 2

echo 
sleep 1

echo -e $YELLOW"--->Creating download directories..."$ENDCOLOR
if [ ! -d "/home/$UNAME/.config" ]; then
	mkdir /home/$UNAME/.config
fi
if [ ! -d "/home/$UNAME/.config/transmission" ];
then
	echo -e 'No previous Transmission configuration files found'
	mkdir /home/$UNAME/.config/transmission
else
	mv /home/$UNAME/.config/transmission /home/$UNAME/.config/transmission_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	echo -e 'Existing Transmission configurations were moved to '$CYAN'/home/$UNAME/.config/transmission_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
	mkdir /home/$UNAME/.config/transmission
fi
if [ ! -d "/home/$UNAME/Downloads" ]; then
	mkdir /home/$UNAME/Downloads
fi
if [ ! -d "/home/$UNAME/Downloads/transmission" ]; then
	mkdir /home/$UNAME/Downloads/transmission
fi
if [ ! -d "/home/$UNAME/Downloads/transmission/incomplete" ]; then
	mkdir /home/$UNAME/Downloads/transmission/incomplete
fi

echo -e 'Following directories created...'
echo -e $CYAN'/home/'$UNAME'/.config/transmission'$ENDCOLOR ' - Transmission Settings'
echo -e $CYAN'/home/'$UNAME'/Downloads'$ENDCOLOR ' - Watched Folder'
echo -e $CYAN'/home/'$UNAME'/Downloads/transmission'$ENDCOLOR ' - Completed Downloads'
echo -e $CYAN'/home/'$UNAME'/Downloads/transmission/incomplete'$ENDCOLOR ' - Incomplete Downloads'

sleep 1
echo 

echo -e $YELLOW"--->Making some configuration changes..."$ENDCOLOR
sudo sed -i 's/USER=debian-transmission/USER='$UNAME'/g' /etc/init.d/transmission-daemon  || { echo -e $RED'Replacing daemon username in init failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's|/var/lib/transmission-daemon/info|/home/'$UNAME'/.config/transmission|g' /etc/default/transmission-daemon  || { echo -e $RED'Replacing config directory in defualt failed.'$ENDCOLOR ; exit 1; }

sleep 1
echo 

echo -e $YELLOW"--->Copying settings file and setting permissions..."$ENDCOLOR
cp $SCRIPTPATH/transmission/transmission-initial-settings.json /home/$UNAME/.config/transmission/settings.json || { echo -e $RED'Initial settings move failed.'$ENDCOLOR ; exit 1; }
cd /home/$UNAME/.config/transmission
sudo usermod -a -G debian-transmission $UNAME  || { echo -e $RED'Adding debian-transmission group to user failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME:debian-transmission settings.json  || { echo -e $RED'Chown settings.json failed'$ENDCOLOR ; exit 1; }
sudo rm /var/lib/transmission-daemon/info/settings.json > /dev/null 2>&1
sudo ln -s /home/$UNAME/.config/transmission/settings.json /var/lib/transmission-daemon/info/settings.json || { echo -e $RED'Creating settings.json symbolic link failed.'$ENDCOLOR ; exit 1; }
sudo chown -R $UNAME: /home/$UNAME/Downloads/transmission
sudo chown -R $UNAME:debian-transmission /home/$UNAME/.config/transmission
sudo chmod -R 775 /home/$UNAME/Downloads/transmission
sudo chmod -R 775 /home/$UNAME/.config/transmission
sudo chmod -R 775 /var/lib/transmission-daemon
sudo chmod g+s /home/$UNAME/.config/transmission
sudo chmod g+s /home/$UNAME/Downloads/transmission

echo 
sleep 1

echo -e $YELLOW"--->Setting up Transmission User, WebUI User and Password..."$ENDCOLOR
sed -i 's|USER_NAME|'$UNAME'|g' /home/$UNAME/.config/transmission/settings.json || { echo -e $RED'Replacing username in settings-json failed.'$ENDCOLOR ; exit 1; }

echo -n 'Set a username for Transmission WebUI and press [ENTER]: '
read TUNAME
if [ -z "$TUNAME" ]
   then
   echo -e '    No username entered so setting default username: '$CYAN'transmission'$ENDCOLOR
   TUNAME=transmission
   else 
   echo -e '    WebUI username set to:'$CYAN $TUNAME $ENDCOLOR
fi
sed -i 's|WEBUI_USERNAME|'$TUNAME'|g' /home/$UNAME/.config/transmission/settings.json || { echo -e $RED'Setting new username in settings.json failed.'$ENDCOLOR ; exit 1; }

echo -n 'Set a password for Transmission WebUI and press [ENTER]: '
read TPASS
if [ -z "$TPASS" ]
   then
   echo -e '    No password entered so setting default password: '$CYAN'transmission'$ENDCOLOR
   TPASS=transmission
   else 
   echo -e '    WebUI password set to: '$CYAN$TPASS$ENDCOLOR
fi
sed -i 's|WEBUI_PASSWORD|'$TPASS'|g' /home/$UNAME/.config/transmission/settings.json || { echo -e $RED'Setting new password in settings.json failed.'$ENDCOLOR ; exit 1; }
sed -i 's|USER_NAME|'$UNAME'|g' /home/$UNAME/.config/transmission/settings.json || { echo -e $RED'Replacing username in settings-json failed.'$ENDCOLOR ; exit 1; }

echo 
sleep 1

echo -e $YELLOW"--->Setting setuid and setgid..."$ENDCOLOR
sudo sed -i 's/setuid debian-transmission/setuid '$UNAME'/g' /etc/init/transmission-daemon.conf  || { echo -e $RED'Replacing setuid failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's/setgid debian-transmission/setgid '$UGROUP'/g' /etc/init/transmission-daemon.conf  || { echo -e $RED'Replacing setgid failed.'$ENDCOLOR ; exit 1; }

echo 
sleep 1

echo -e $YELLOW"--->Enabling autostart during boot..."$ENDCOLOR
sudo update-rc.d transmission-daemon defaults

echo 
sleep 1

echo -e $YELLOW"--->Starting Transmission..."$ENDCOLOR
sudo /etc/init.d/transmission-daemon start >/dev/null 2>&1
kill -s SIGHUP `pidof transmission-daemon` >/dev/null 2>&1

echo 
sleep 1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e $YELLOW'--->Please read the instructions below clearly. When you are done reboot your system using '$RED'sudo reboot'$YELLOW' command.'$ENDCOLOR
echo -e 'Note down the the Transmission directories created above. Transmission should autostart on reboot. If not run '$CYAN'sudo /etc/init.d/transmission-daemon start'$ENDCOLOR'. Then open '$CYAN'http://localhost:9091'$ENDCOLOR' in your browser.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
