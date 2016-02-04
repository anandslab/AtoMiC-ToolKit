#!/bin/bash
echo 
sleep 1
echo -e $YELLOW'--->Creating a list of '$APPTITLE' files to backup...'$ENDCOLOR
cp $SCRIPTPATH/$APPNAME/$APPNAME-backup-files $SCRIPTPATH/tmp/$APPSHORTNAME-backup-files || { echo -e $RED'Creating backup list failed.'$ENDCOLOR; exit 1; }
sudo sed -i 's@APPPATH@'"$APPPATH"'@g' $SCRIPTPATH/tmp/$APPSHORTNAME-backup-files  || { echo -e $RED'Replacing '$APPTITLE' path in backup list failed.'$ENDCOLOR; exit 1; }
