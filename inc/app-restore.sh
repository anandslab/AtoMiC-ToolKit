#!/bin/bash
echo
sleep 1

echo -e "$YELLOW--->Select $APPTITLE backup file to restore...$ENDCOLOR"

sleep 1

source "$SCRIPTPATH/inc/fileselect.sh"

if [[ $exitstatus = 0 ]]; then
    BFILE=$SCRIPTPATH'/backups/'$FILECHOICE

    source "$SCRIPTPATH/inc/app-stop.sh"

    echo
    sleep 1
    
    #http://www.cyberciti.biz/faq/bash-loop-over-file/
    echo -e $YELLOW'--->Checking for existing files...'$ENDCOLOR
    DATETIME=`date '+%m-%d-%Y_%H-%M'`
   
    while IFS= read -r file
    do
        echo -e "Restoring $CYAN$file$ENDCOLOR..."
        if [[ -f $file ]] || [[ -d $file ]]; then
            NEWFILENAME=$file'_'$DATETIME
            mv "$file" "$NEWFILENAME"
            echo -e 'Moved existing '$CYAN$file$ENDCOLOR' to '$CYAN$NEWFILENAME$ENDCOLOR
        fi
    done < "$SCRIPTPATH/tmp/$APPSHORTNAME-backup-files"

    echo
    sleep 1

    echo -e 'Restoring the following files from: '$CYAN$BFILE$ENDCOLOR
    tar -C / -zxvf $BFILE || { echo -e $RED'Extracting files failed.'$ENDCOLOR ; exit 1; }

    source "$SCRIPTPATH/inc/app-set-permissions.sh"
    source "$SCRIPTPATH/inc/app-start.sh"
else
    echo
    echo -e "${RED}Restoring $APPTITLE backup cancelled.$ENDCOLOR"
fi 
