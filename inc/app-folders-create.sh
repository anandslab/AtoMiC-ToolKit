#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Creating '$APPTITLE' folders...'$ENDCOLOR
DATETIME=`date '+%m-%d-%Y_%H-%M'`
while IFS= read -r folder
do
	echo -e 'Creating '$CYAN$folder$ENDCOLOR'...'
    if [ -d "$folder" ]; then
		NEWFOLDERNAME=$folder'_'$DATETIME
		mv $folder $NEWFOLDERNAME
		#echo $NEWFILENAME
		echo -e 'Moved existing '$CYAN$folder$ENDCOLOR' to '$CYAN$NEWFOLDERNAME$ENDCOLOR
	fi
    mkdir $folder
done < "$SCRIPTPATH/tmp/$APPSHORTNAME-folders-list"
    