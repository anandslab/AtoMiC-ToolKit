#!/bin/bash
if [ ! -f "$APPSETTINGS" ]; 
then
	echo -e $RED'Error! '$CYAN$APPSETTINGS$RED' not found. '$ENDCOLOR$APPTITLE' not installed or incompatible installation.'
    echo -e 'Exiting. If '$APPTITLE' is installed, use '$CYAN'sudo ./setup.sh'$ENDCOLOR' to start it.'
    echo
    cd $SCRIPTPATH
    exit 1;
fi
