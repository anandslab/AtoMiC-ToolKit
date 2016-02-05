#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Creating '$APPTITLE' files / folders...'$ENDCOLOR
cp $SCRIPTPATH/$APPNAME/$APPNAME-folders-list $SCRIPTPATH/tmp/$APPSHORTNAME-folders-list || { echo -e $RED'Creating folders list failed.'$ENDCOLOR; exit 1; }
sudo sed -i 's@APPPATH@'"$APPPATH"'@g' $SCRIPTPATH/tmp/$APPSHORTNAME-folders-list  || { echo -e $RED'Replacing '$APPTITLE' path in folders list failed.'$ENDCOLOR; exit 1; }
sudo sed -i 's@UNAME@'"$UNAME"'@g' $SCRIPTPATH/tmp/$APPSHORTNAME-folders-list  || { echo -e $RED'Replacing username in folders list failed.'$ENDCOLOR; exit 1; }
#DATETIME=`date '+%m-%d-%Y_%H-%M'`
while IFS= read -r folder
do
	echo -e 'Creating '$CYAN$folder$ENDCOLOR'...'
    if [ ! -d "$folder" ]; then
		mkdir $folder
		sudo chown $UNAME:$UGROUP $folder >/dev/null 2>&1
		sudo chmod -R 775 $folder >/dev/null 2>&1
		sudo chmod -R g+s $folder >/dev/null 2>&1
		echo -e '...created.'
	else
		echo -e '...already exists.'
		sudo chown $UNAME:$UGROUP $folder >/dev/null 2>&1
		sudo chmod -R 775 $folder >/dev/null 2>&1
		sudo chmod -R g+s $folder >/dev/null 2>&1        
	fi

done < "$SCRIPTPATH/tmp/$APPSHORTNAME-folders-list"
    
