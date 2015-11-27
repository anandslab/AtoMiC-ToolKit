#!/bin/bash
# Script Name: AtoMiC Mylar Installer
# Author: PREngineer
# Publisher: http://www.htpcbeginner.com
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
echo -e $GREEN'AtoMiC Mylar Installer Script'$ENDCOLOR
echo
echo -e $YELLOW'--->Mylar installation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. By proceeding you authorize this script to install any relevant packages required to install and configure Mylar.'
echo -e '5. Best used on a clean system (with no previous Mylar install) or after complete removal of previous Mylar installation.'

echo

read -p 'Type y/Y and press [ENTER] to AGREE and continue with the installation or any other key to exit: '
RESP=${REPLY,,}

if [ "$RESP" != "y" ]
then
        echo -e $RED'So you chickened out. Maybe you will try again later.'$ENDCOLOR
        echo
        pause 'Press [Enter] key to continue...'
        cd $SCRIPTPATH
        sudo ./setup.sh
        exit 0
fi

echo

echo -n 'Type the username of the user you want to run Mylar as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME

if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
        echo -e $RED'Bummer! You may not have entered your username correctly. Exiting now. Please rerun script.'$ENDCOLOR
        echo
        pause 'Press [Enter] key to continue...'
        cd $SCRIPTPATH
        sudo ./setup.sh
        exit 0
fi
UGROUP=($(id -gn $UNAME))

echo

echo -e $YELLOW'--->Refreshing packages list...'$ENDCOLOR
sudo apt-get update

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
echo "# COPY THIS FILE TO /etc/default/mylar" >> mylar || { echo 'Could not create default file.' ; exit 1; }
echo "# OPTIONS: MYLAR_HOME, MYLAR_USER, MYLAR_DATA, MYLAR_PIDFILE, PYTHON_BIN, MYLAR_OPTS, SSD_OPTS" >> mylar
echo "MYLAR_HOME=/home/"$UNAME"/.mylar/" >> mylar
echo "MYLAR_DATA=/home/"$UNAME"/.mylar/" >> mylar
echo "MYLAR_PORT=8090" >> mylar

echo -e 'Enabling user'$CYAN $UNAME $ENDCOLOR'to run Mylar...'
echo "MYLAR_USER="$UNAME >> mylar
sudo mv mylar /etc/default/

echo
sleep 1

echo -e $YELLOW'--->Enabling Mylar AutoStart at Boot...'$ENDCOLOR
sudo cp /home/$UNAME/.mylar/init-scripts/ubuntu.init.d /etc/init.d/mylar || { echo $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME: /etc/init.d/mylar
sudo chmod +x /etc/init.d/mylar
sudo update-rc.d mylar defaults

echo
sleep 1

echo -e 'Stashing any changes made to Mylar...'
cd /home/$UNAME/.mylar
git config user.email “atomic@htpcbeginner.com"
git config user.name “AtoMiCUser"
git stash
git stash clear

echo
sleep 1

echo -e 'Starting Mylar'
sudo /etc/init.d/mylar start >/dev/null 2>&1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'Mylar should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/mylar start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:8090'$ENDCOLOR' in your browser.'
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC Mylar Install script from www.htpcBeginner.com.'$ENDCOLOR
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo ./setup.sh
exit 0
