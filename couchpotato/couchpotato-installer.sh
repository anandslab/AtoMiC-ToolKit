#!/bin/bash
# Script Name: AtoMiC CouchPotato Installer
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

source $SCRIPTPATH/couchpotato/couchpotato-constants.sh

echo -e $GREEN'AtoMiC '$APPTITLE' Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh
source $SCRIPTPATH/inc/app-install-deps.sh
source $SCRIPTPATH/inc/app-move-previous.sh
source $SCRIPTPATH/inc/app-git-download.sh

echo
sleep 1

echo -e $YELLOW'--->Configuring '$APPTITLE' Install...'$ENDCOLOR
echo "# COPY THIS FILE TO /etc/default/couchpotato" >> $SCRIPTPATH/tmp/couchpotato_default || { echo 'Could not create default file.' ; exit 1; }
echo "# OPTIONS: CP_HOME, CP_USER, CP_DATA, CP_PIDFILE, PYTHON_BIN, CP_OPTS, SSD_OPTS" >> $SCRIPTPATH/tmp/couchpotato_default
echo "CP_HOME="$APPPATH"/" >> $SCRIPTPATH/tmp/couchpotato_default
echo "CP_DATA="$APPPATH"/" >> $SCRIPTPATH/tmp/couchpotato_default

echo -e 'Enabling user'$CYAN $UNAME $ENDCOLOR'to run CouchPotato...'
echo "CP_USER="$UNAME >> $SCRIPTPATH/tmp/couchpotato_default
sudo mv $SCRIPTPATH/tmp/couchpotato_default /etc/default/couchpotato

sudo cp $APPPATH/init/ubuntu /etc/init.d/couchpotato || { echo $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
source $SCRIPTPATH/inc/app-init-add.sh

source $SCRIPTPATH/inc/app-git-stash.sh
source $SCRIPTPATH/inc/app-start.sh
source $SCRIPTPATH/inc/app-install-confirmation.sh

echo -e 'CouchPotato should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/couchpotato start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:5050'$ENDCOLOR' in your browser.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
