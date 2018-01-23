#!/bin/bash
echo -e "$YELLOW--->Creating a list of $APPTITLE files to backup...$ENDCOLOR"

if [[ -f $SCRIPTPATH/utils/$APPNAME/$APPNAME-backup-files ]]; then
    cp $SCRIPTPATH/utils/$APPNAME/$APPNAME-backup-files $SCRIPTPATH/tmp/$APPSHORTNAME-backup-files || { echo -e $RED'Creating backup list failed.'$ENDCOLOR; exit 1; }
else
    cp $SCRIPTPATH/$APPNAME/$APPNAME-backup-files $SCRIPTPATH/tmp/$APPSHORTNAME-backup-files || { echo -e $RED'Creating backup list failed.'$ENDCOLOR; exit 1; }
fi

sudo sed -i "s@APPPATH@$APPPATH@g" $SCRIPTPATH/tmp/$APPSHORTNAME-backup-files  || { echo -e $RED'Replacing '$APPTITLE' path in backup list failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@APPSETTINGSDIR@$APPSETTINGSDIR@g" $SCRIPTPATH/tmp/$APPSHORTNAME-backup-files  || { echo -e $RED'Replacing '$APPTITLE' path in backup list failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@APPSETTINGSDB@$APPSETTINGSDB@g" $SCRIPTPATH/tmp/$APPSHORTNAME-backup-files  || { echo -e $RED'Replacing '$APPTITLE' path in backup list failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@APPSETTINGS@$APPSETTINGS@g" $SCRIPTPATH/tmp/$APPSHORTNAME-backup-files  || { echo -e $RED'Replacing '$APPTITLE' path in backup list failed.'$ENDCOLOR; exit 1; }
