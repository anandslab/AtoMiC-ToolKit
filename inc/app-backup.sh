#!/bin/bash

echo
sleep 1

echo -e "$YELLOW--->Backing up files...$ENDCOLOR"
BFN=$APPNAME'_'$(date '+%m-%d-%Y_%H-%M')

if tar -zcvf "$SCRIPTPATH/tmp/$BFN.tar.gz" --files-from "$SCRIPTPATH/tmp/$APPSHORTNAME-backup-files"; then
    echo
    echo -e "${GREEN}All files/folders present from the following list were backed up:$ENDCOLOR"
    cat "$SCRIPTPATH/tmp/$APPSHORTNAME-backup-files"

else
    echo
    echo -e "${RED}One or more files failed to backup. See above for more information.$ENDCOLOR"
fi

rm "$SCRIPTPATH/tmp/$APPSHORTNAME-backup-files"

echo
echo -e "$YELLOW--->Moving $APPTITLE backup to $CYAN$SCRIPTPATH/backups/$BFN.tar.gz...$ENDCOLOR"
mv "$SCRIPTPATH/tmp/$BFN.tar.gz" "$SCRIPTPATH/backups/"
sudo chown $UNAME:$UGROUP $SCRIPTPATH/backups/$BFN.tar.gz
sudo chmod 755 $SCRIPTPATH/backups/$BFN.tar.gz
