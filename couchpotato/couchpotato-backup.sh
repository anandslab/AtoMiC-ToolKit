#!/bin/bash
# Script Name: AtoMiC CouchPotato Backup Script
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
source $2/inc/header.sh

echo -e $GREEN'AtoMiC CouchPotato Backup Script'$ENDCOLOR
echo 
echo -e $YELLOW'--->CouchPotato backup will start soon. Please read the following carefully.'$ENDCOLOR

echo -e '1. The script has been confirmed to work on Ubuntu variants, Mint, and Ubuntu Server.'
echo -e '2. While several testing runs identified no known issues, '$CYAN'www.htpcBeginner.com'$ENDCOLOR' or the authors cannot be held accountable for any problems that might occur due to the script.'
echo -e '3. If you did not run this script with sudo, you maybe asked for your root password during installation.'
echo -e '4. Best used to backup CouchPotato installed using AtoMiC ToolKit or '$CYAN'www.htpcBeginner.com'$ENDCOLOR' guides.'

source $2/inc/consent.sh

echo -n 'Type the username of the user you run CouchPotato as and press [ENTER]. Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '

source $2/inc/usercheck.sh

echo -e $YELLOW'--->Creating a list of files to backup...'$ENDCOLOR
cp $2/couchpotato/couchpotato-backup-files $2/couchpotato/cp-backup-files
cat cp-backup-files
sudo sed -i 's/UNAME/'$UNAME'/g' $2/couchpotato/cp-backup-files  || { echo -e $RED'Replacing username in backup list failed.'$ENDCOLOR ; exit 1; }
cat cp-backup-files

echo
sleep 20

echo -e $YELLOW'--->Backing up files...'$ENDCOLOR
BFN=couchpotato_`date '+%m-%d-%Y_%H-%M'`
tar -zcvf $BFN.tar.gz --files-from $2/couchpotato/cp-backup-files
echo -e "Following files were backed up:"
cat $2/couchpotato/cp-backup-files
rm $2/couchpotato/cp-backup-files

echo
sleep 1
echo -e $YELLOW'--->Moving backup file to '$CYAN'/home/$UNAME/'$BFN'.tar.gz...'$ENDCOLOR
sudo chown $UNAME:$UGROUP $BFN.tar.gz
sudo chmod 755 $BFN.tar.gz
mv $BFN.tar.gz /home/$UNAME/

sleep 1

echo
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'CouchPotato files backed up. You can use the restore utility to restore it on a new computer.'

source $2/inc/thankyou.sh
source $2/inc/exit.sh



