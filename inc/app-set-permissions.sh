#!/bin/bash
echo
echo -e "${YELLOW}--->Setting permissions...$ENDCOLOR"
if [[ ! -z $APPPATH ]]; then
    sudo chown -R $UNAME:$UGROUP "$APPPATH"
    sudo chmod -R 775 "$APPPATH"
    sudo chmod -R g+s "$APPPATH"
    echo -e "$CYAN$APPPATH$ENDCOLOR Done"
fi

if [[ ! -z $APPSETTINGSDIR ]] && [[ -d $APPSETTINGSDIR ]]; then
    sudo chown -R $UNAME:$UGROUP "$APPSETTINGSDIR"
    sudo chmod -R 775 "$APPSETTINGSDIR"
    sudo chmod -R g+s "$APPSETTINGSDIR"
    echo -e "$CYAN$APPSETTINGSDIR$ENDCOLOR Done"   
fi
