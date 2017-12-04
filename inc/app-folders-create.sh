#!/bin/bash
echo
sleep 1
echo -e "$YELLOW--->Creating $APPTITLE files / folders...$ENDCOLOR"

if [[ -f $SCRIPTPATH/utils/$APPNAME/$APPNAME-folders-list ]]; then
    cp $SCRIPTPATH/utils/$APPNAME/$APPNAME-folders-list $SCRIPTPATH/tmp/$APPSHORTNAME-folders-list || { echo -e "${RED}Creating folders list failed.$ENDCOLOR"; exit 1; }
else
    cp $SCRIPTPATH/$APPNAME/$APPNAME-folders-list $SCRIPTPATH/tmp/$APPSHORTNAME-folders-list || { echo -e "${RED}Creating folders list failed.$ENDCOLOR"; exit 1; }
fi

sudo sed -i "s@APPPATH@$APPPATH@g" $SCRIPTPATH/tmp/$APPSHORTNAME-folders-list  || { echo -e "${RED}Replacing $APPTITLE path in folders list failed.$ENDCOLOR"; exit 1; }
sudo sed -i "s@APPSETTINGSDIR@$APPSETTINGSDIR@g" $SCRIPTPATH/tmp/$APPSHORTNAME-folders-list  || { echo -e "${RED}Replacing $APPTITLE path in folders list failed.$ENDCOLOR"; exit 1; }
sudo sed -i "s@UNAME@$UNAME@g" $SCRIPTPATH/tmp/$APPSHORTNAME-folders-list  || { echo -e "${RED}Replacing username in folders list failed.$ENDCOLOR"; exit 1; }

#Need encapsulate the $folder for folders with spaces
while IFS= read -r folder; do
    echo -e 'Creating '$CYAN$folder$ENDCOLOR'...'
    if [[ ! -d $folder ]]; then
        mkdir -p "$folder"
        echo -e '...created.'
    else
        echo -e '...already exists.'
    fi

    sudo chown $UNAME:$UGROUP "$folder" || { echo -e "${RED}Chown on $folder failed.$ENDCOLOR"; exit 1; }
    sudo chmod -R 775 "$folder" || { echo -e "${RED}Chmod on $folder failed.$ENDCOLOR"; exit 1; }
    sudo chmod -R g+s "$folder" || { echo -e "${RED}Chmod on $folder failed.$ENDCOLOR"; exit 1; }

done < "$SCRIPTPATH/tmp/$APPSHORTNAME-folders-list"
