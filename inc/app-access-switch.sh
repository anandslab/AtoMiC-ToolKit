#!/bin/bash

source "$SCRIPTPATH/inc/app-setup-check.sh"
source "$SCRIPTPATH/inc/commons.sh"
source "$SCRIPTPATH/inc/header.sh"

echo -e $GREEN'AtoMiC '$APPTITLE' Access Fix'$ENDCOLOR

source "$SCRIPTPATH/inc/pause.sh"
source "$SCRIPTPATH/inc/app-folder-check.sh"
source "$SCRIPTPATH/inc/app-settings-check.sh"

echo 
sleep 2
source "$SCRIPTPATH/inc/app-stop.sh"
sleep 2
echo

if grep -Exq "${ACCESSHOST}0.0.0.0" $APPSETTINGS; then
    echo -e $YELLOW'--->Making '$APPTITLE' only accessible from localhost...'$ENDCOLOR
    sudo sed -i "s@^${ACCESSHOST}.*@${ACCESSHOST}localhost@g" $APPSETTINGS  || { echo -e $RED'Modifying '$ACCESSHOST' in '$APPSETTINGS' file failed.'$ENDCOLOR; exit 1; }
else
    echo -e $YELLOW'--->Making '$APPTITLE' accessible from network...'$ENDCOLOR
    sudo sed -i "s@^${ACCESSHOST}localhost@${ACCESSHOST}0.0.0.0@g" $APPSETTINGS  || { echo -e $RED'Modifying '$ACCESSHOST' in '$APPSETTINGS' file failed.'$ENDCOLOR; exit 1; }
fi

sleep 2
source "$SCRIPTPATH/inc/app-start.sh"
sleep 2
echo
echo -e $GREEN'--->All done. '$APPTITLE' access switch complete.'$ENDCOLOR

source "$SCRIPTPATH/inc/thankyou.sh"
source "$SCRIPTPATH/inc/exit.sh"
