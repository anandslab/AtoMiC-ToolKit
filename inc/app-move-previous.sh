#!/bin/bash
echo
source $SCRIPTPATH/inc/app-init-remove.sh
source $SCRIPTPATH/inc/app-systemd-remove.sh
sleep 1
echo
echo -e $YELLOW"--->Checking for previous version of $APPTITLE..."$ENDCOLOR
if [ -d "$APPPATH" ]; then
	MOVEPATH=$APPPATH"_"`date '+%m-%d-%Y_%H-%M'`
	mv $APPPATH $MOVEPATH || { echo "Could not move exiting $APPTITLE folder." ; exit 1; }
	echo -e "Existing $APPTITLE files were moved to "$CYAN$MOVEPATH$ENDCOLOR
else
	echo "No previous $APPTITLE folder found to backup"
fi