#!/bin/bash
if [ ! -d "$APPPATH" ]; 
then
	echo -e $RED'Error! '$CYAN$APPPATH$RED' not found. '$APPTITLE' not installed or incompatible installation.'$ENDCOLOR
    source $SCRIPTPATH/inc/pause.sh
    source $SCRIPTPATH/inc/menu-$APPNAME.sh
fi