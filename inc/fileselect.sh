#!/bin/bash
cd $SCRIPTPATH/backups
FILES=(*)
cd $SCRIPTPATH
FILELIST=()
for ((i=0; i<${#FILES[@]}; i++))
do
	if [[ ${FILES[$i]} == *"$APPNAME"* ]]
	then
  		FILELIST+=("${FILES[$i]}" "")
	fi
done

if [[ -z "$FILELIST" ]]; then
	echo -e $RED'No '$APPNAME' backups were found in '$CYAN$SCRIPTPATH'/backups folder. Cannot perform restore. Returning to menu.'$ENDCOLOR
    source $SCRIPTPATH/inc/pause.sh
    source $SCRIPTPATH/$APPNAME/$APPNAME-menu.sh
else 
	FILECHOICE=$(whiptail --title "AtoMiC ToolKit - Restore Backup" --menu "Select the backup file you want to restore:" --backtitle "$BACKTITLE" --fb --ok-button "Select" $LINES $COLUMNS $NETLINES "${FILELIST[@]}" 3>&1 1>&2 2>&3)
	exitstatus=$?
fi
