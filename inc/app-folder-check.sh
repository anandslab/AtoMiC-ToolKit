#!/bin/bash
if [ ! -d "$APPPATH" ]; 
then
	echo -e $RED'Error! '$CYAN$APPPATH$RED' not found. '$APPTITLE' not installed or incompatible installation.'$ENDCOLOR
    cd $SCRIPTPATH
    echo 'Exiting. If '$APPTITLE' is installed, use sudo ./setup.sh to start it.'
    echo
    exit 1;
fi