#!/bin/bash
if [ ! -f "$APPSETTINGS" ]; 
then
	echo -e $RED'Error! '$CYAN$APPSETTINGS$RED' not found. '$APPTITLE' not installed or incompatible installation.'$ENDCOLOR
    source $SCRIPTPATH/inc/pause.sh
    source $SCRIPTPATH/inc/menu-$APPNAME.sh
fi
