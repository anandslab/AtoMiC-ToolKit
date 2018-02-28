#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Configuring '$APPTITLE' Install...'$ENDCOLOR
APPSHORTNAMEU="${APPSHORTNAME^^}"
DEFAULTFILE=$SCRIPTPATH'/tmp/'$APPNAME'_default'
echo $APPSHORTNAMEU"_HOME=$APPPATH/" >> $DEFAULTFILE || { echo 'Could not create '$APPTITLE' default file.' ; exit 1; }
echo $APPSHORTNAMEU"_DATA=$APPPATH/" >> $DEFAULTFILE
echo -e 'Enabling user '$CYAN$UNAME$ENDCOLOR' to run '$APPTITLE'...'
echo $APPSHORTNAMEU"_USER="$UNAME >> $DEFAULTFILE
sudo mv $DEFAULTFILE "/etc/default/"$APPNAME || { echo 'Could not move '$APPTITLE' default file.' ; exit 1; }
