#!/bin/bash
# Script Name: AtoMiC .bash_aliases Installer
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

echo -e $GREEN'AtoMiC .bash_aliases Installer for HTPCs and Home Servers'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

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
cp $SCRIPTPATH/utils/.bash_aliases . || { echo -e $RED'.bash_aliases not copied.'$ENDCOLOR ; exit 1; }
sudo chown $UNAME:$UGROUP .bash_aliases >/dev/null 2>&1
chmod 755 .bash_aliases >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Reloading .bash_aliases...'$ENDCOLOR
. ~/.bashrc

echo
echo -e $GREEN'--->All done. New .bash_aliases now active.'$ENDCOLOR
echo -e 'Please visit '$CYAN' http://www.htpcbeginner.com/create-shortcut-to-commands-using-bashaliases-in-ubuntu/'$ENDCOLOR' to understand how to use .bash_aliases.'
echo -e 'Please read .bash_aliases file for all available shortcut commands.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
