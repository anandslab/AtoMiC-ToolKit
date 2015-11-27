#!/bin/bash
# Script Name: AtoMiC .bash_aliases Installer
# Author: htpcBeginner
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
echo -e $GREEN'AtoMiC .bash_aliases Installer for HTPCs and Home Servers'$ENDCOLOR
echo 
echo -e $YELLOW'--->.bash_aliases installation will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. By proceeding you authorize this script to make changes required to install .bash_aliases.'
echo -e '4. Best used on a clean system (with no previous .bash_aliases). Any previous .bash_aliases will be backed up.'

echo

read -p 'Type y/Y and press [ENTER] to AGREE and continue with the installation or any other key to exit: '
RESP=${REPLY,,}

if [ "$RESP" != "y" ] 
then
	echo -e $RED'So you chickened out. May be you will try again later.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	sudo ./setup.sh
	exit 0
fi

echo 

echo -n 'Type your username and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME

if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
	echo -e $RED'Bummer! You may not have entered your username correctly. Exiting now. Please rerun script.'$ENDCOLOR
	echo
	pause 'Press [Enter] key to continue...'
	cd $SCRIPTPATH
	sudo ./setup.sh
	exit 0
fi

echo
sleep 1

echo -e $YELLOW'--->Checking for .bashrc file...'$ENDCOLOR
if [ ! -f "/home/$UNAME/.bashrc" ];
then
	echo -e $CYAN'/home/'$UNAME'/.bashrc'$ENDCOLOR' file not found. Creating it.'
	sudo cp /etc/skel/.bashrc /home/$UNAME/.bashrc || { echo -e $RED'Copying .bashrc failed.'$ENDCOLOR ; exit 1; }
	sudo chown $UNAME: /home/$UNAME/.bashrc
else
	echo -e $CYAN'/home/'$UNAME'/.bashrc'$ENDCOLOR' exists.'
fi

echo
sleep 1

echo -e $YELLOW'--->Checking for .profile file...'$ENDCOLOR
if [ ! -f "/home/$UNAME/.profile" ];
then
	echo -e $CYAN'/home/'$UNAME'/.profile'$ENDCOLOR' file not found. Creating it.'
	sudo cp /etc/skel/.profile /home/$UNAME/.profile || { echo -e $RED'Copying .profile failed.'$ENDCOLOR ; exit 1; }
	sudo chown $UNAME: /home/$UNAME/.profile
else
	echo -e $CYAN'/home/'$UNAME'/.profile'$ENDCOLOR' exists.'
fi

echo
sleep 1

echo -e $YELLOW'--->Checking for previous .bash_aliases...'$ENDCOLOR
if [ -f "/home/$UNAME/.bash_aliases" ]; then
	mv /home/$UNAME/.bash_aliases /home/$UNAME/.bash_aliases_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	echo -e 'Existing .bash_aliases file was moved to '$CYAN'/home/'$UNAME'/.bash_aliases_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous .bash_aliases file found.'
fi

echo
sleep 1

echo -e $YELLOW'--->Checking for .bash_aliases updates...'$ENDCOLOR
git pull >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Copying .bash_aliases...'$ENDCOLOR
cd /home/$UNAME
cp $SCRIPTPATH/.bash_aliases . || { echo -e $RED'.bash_aliases not copied.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME: .bash_aliases >/dev/null 2>&1
chmod 755 .bash_aliases >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Reloading .bash_aliases...'$ENDCOLOR
. ~/.bashrc

echo
echo -e $GREEN'--->All done. New .bash_aliases now active.'$ENDCOLOR
echo -e 'Please visit '$CYAN' http://www.htpcbeginner.com/create-shortcut-to-commands-using-bashaliases-in-ubuntu/'$ENDCOLOR' to understand how to use .bash_aliases.'
echo -e 'Please read .bash_aliases file for all available shortcut commands.'
echo
echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
echo -e $YELLOW'Thank you for using the AtoMiC .bash_aliases Install script from www.htpcBeginner.com.'$ENDCOLOR 
echo

pause 'Press [Enter] key to continue...'

cd $SCRIPTPATH
sudo ./setup.sh
exit 0