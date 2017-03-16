#!/bin/bash
if [ ! -f "$APPSETTINGS" ]; 
then
    echo -e $RED $APPSETTINGS 'not found. '$ENDCOLOR$APPTITLE' not installed or incompatible installation.
 Please open '$APPNAME', and try saving the config first else you may need to reinstall. '$ENDCOLOR
    echo -e ' Exiting. If '$APPTITLE' is installed, use '$CYAN'sudo ./setup.sh'$ENDCOLOR' to start it.'
    echo
    cd $SCRIPTPATH
    exit 1;
fi
