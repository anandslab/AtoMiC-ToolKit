#!/bin/bash
# Script Name: AtoMiC Webmin Settings Backup Script
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

echo -e $GREEN'AtoMiC Webmin Settings Backup Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

echo -e $YELLOW'--->Creating a list of files to backup...'$ENDCOLOR
cp $SCRIPTPATH/webmin/webmin-backup-files $SCRIPTPATH/tmp/wm-backup-files

echo
sleep 1

echo -e $YELLOW'--->Backing up files...'$ENDCOLOR
BFN=webmin_`date '+%m-%d-%Y_%H-%M'`
tar -zcvf $SCRIPTPATH/tmp/$BFN.tar.gz --ignore-failed-read --files-from $SCRIPTPATH/tmp/wm-backup-files
echo 
echo -e $GREEN"All files / folders present from the following list were backed up:"$ENDCOLOR
cat $SCRIPTPATH/tmp/wm-backup-files
rm $SCRIPTPATH/tmp/wm-backup-files

echo
sleep 1
echo 

echo -e $YELLOW'--->Moving backup file to '$CYAN$SCRIPTPATH'/backups/'$BFN'.tar.gz...'$ENDCOLOR
mv $SCRIPTPATH/tmp/$BFN.tar.gz $SCRIPTPATH/backups/
sudo chown $UNAME:$UGROUP $SCRIPTPATH/backups/$BFN.tar.gz
sudo chmod 755 $SCRIPTPATH/backups/$BFN.tar.gz

echo
sleep 1

echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'Webmin files backed up. You can use the restore utility to restore it on a new computer.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh