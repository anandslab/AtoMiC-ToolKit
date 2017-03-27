#!/bin/bash
if [ ! -d "$APPPATH" ]; 
then
    echo -e $RED'Error! '$CYAN$APPPATH$RED' not found. '$ENDCOLOR$APPTITLE' not installed or incompatible installation.'
    echo
    cd $SCRIPTPATH
    exit 1;
fi
