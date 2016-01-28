#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Configuring '$APPTITLE' Install...'$ENDCOLOR
APPSHORTNAMEU="${$APPSHORTNAME^^}"
echo $APPSHORTNAMEU"_HOME="$APPPATH"/" >> $SCRIPTPATH/tmp/$APPNAME_default || { echo 'Could not '$APPTITLE' create default file.' ; exit 1; }
echo $APPSHORTNAMEU"_DATA="$APPPATH"/" >> $SCRIPTPATH/tmp/$APPNAME_default
echo -e 'Enabling user '$CYAN$UNAME$ENDCOLOR' to run '$APPTITLE'...'
echo $APPSHORTNAMEU"_USER="$UNAME >> $SCRIPTPATH/tmp/$APPNAME_default
sudo mv $SCRIPTPATH/tmp/$APPNAME_default /etc/default/$APPNAME
