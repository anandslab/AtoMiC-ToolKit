#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Checking for previous versions of '$APPTITLE'...'$ENDCOLOR
sleep 1
sudo /etc/init.d/$APPNAME stop >/dev/null 2>&1
echo -e 'Any running '$APPTITLE' processes stopped'
sleep 1
sudo update-rc.d -f $APPNAME remove >/dev/null 2>&1
sudo rm /etc/init.d/$APPNAME >/dev/null 2>&1
sudo rm /etc/default/$APPNAME >/dev/null 2>&1
echo -e 'Any existing '$APPTITLE' init scripts removed'
sleep 1
if [ -d "$APPPATH" ]; then
	mv $APPPATH $APPPATH_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	echo -e 'Existing '$APPTITLE' files were moved to '$CYAN$APPPATH'_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
else
	echo -e 'No previous '$APPTITLE' folder found'
fi