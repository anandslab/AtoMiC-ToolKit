#!/bin/bash
if [ ! -d "$APPPATH" ]; 
then
	echo -e $RED'Error! '$CYAN$APPPATH$RED' not found. '$APPTITLE' not installed or incompatible installation.'$ENDCOLOR
    cd $SCRIPTPATH
    echo 'Exiting. Use '$CYANsudo ./setup.sh$ENDCOLOR' to start again.'
    echo
    exit 1;
fi