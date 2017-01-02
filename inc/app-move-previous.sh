#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Checking for previous versions of '$APPTITLE'...'$ENDCOLOR
sleep 1
source $SCRIPTPATH/inc/app-stop.sh
echo -e 'Any running '$APPTITLE' processes stopped'
sleep 1

source $SCRIPTPATH/inc/app-init-remove.sh
source $SCRIPTPATH/inc/app-systemd-remove.sh

echo -e 'Any existing '$APPTITLE' init and systemd scripts removed'
sleep 1
if [ -d "$APPPATH" ]; then
	MOVEPATH=$APPPATH"_"`date '+%m-%d-%Y_%H-%M'`
	mv $APPPATH $MOVEPATH || { echo 'Could not move exiting '$APPTITLE' folder.' ; exit 1; }
	echo -e 'Existing '$APPTITLE' files were moved to '$CYAN$MOVEPATH$ENDCOLOR
else
	echo -e 'No previous '$APPTITLE' folder found'
fi