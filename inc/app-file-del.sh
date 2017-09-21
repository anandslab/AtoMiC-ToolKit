#!/bin/bash
echo
sleep 1

echo -e "${YELLOW}--->Removing $APPTITLE files/folders...$ENDCOLOR"

source "$SCRIPTPATH/inc/app-folder-check.sh"
FOUND=0
if [[ -d $APPPATH ]] && [[ -z $CI ]]; then
    FOUND=1
    echo -e "${GREEN}Do you want to keep the following $APPTITLE"\
            "settings/data folder for reinstalling later?$ENDCOLOR"
    echo -e "Folder to be kept: $CYAN$APPPATH$ENDCOLOR"
    read -r -p "Type y/Y to keep or any other key to delete, and press [ENTER] : "
    FILEDEL=${REPLY,,}

    if [[ $FILEDEL != "y" ]]; then
        echo
        if [[ -d $APPPATH ]]; then
            echo -e "$YELLOW--->Deleting $APPTITLE"\
                    "files/folders from $CYAN$APPPATH$YELLOW...$ENDCOLOR"
            sudo rm -r "$APPPATH"
            echo 'OK'
        else
            echo -e "$RED--->$APPTITLE files/folders not deleted. "\
                    "Path not found: $CYAN$APPPATH$ENDCOLOR"
        fi
    else
        echo
        echo -e "$YELLOW--->Keeping $APPTITLE files/folders in "\
                "$CYAN$APPPATH$YELLOW...$ENDCOLOR"
    fi
fi

if [[ -d $APPSETTINGSDIR ]] && [[ -z $CI ]]; then
    FOUND=1
    echo -e "${GREEN}Do you want to keep the following $APPTITLE"\
            "settings/data folder for reinstalling later?$ENDCOLOR"
    echo -e "Folder to be kept: $CYAN$APPSETTINGSDIR$ENDCOLOR"
    read -r -p "Type y/Y to keep or any other key to delete, and press [ENTER] : "
    FILEDEL2=${REPLY,,}

    if [[ $FILEDEL2 != "y" ]]; then
        echo
        if [[ -d $APPSETTINGSDIR ]]; then
            echo -e "$YELLOW--->Deleting $APPTITLE files/folders"\
                    "from $CYAN$APPSETTINGSDIR$YELLOW...$ENDCOLOR"
            sudo rm -r "$APPSETTINGSDIR"
            echo 'OK'
        else
            echo -e "$RED--->$APPTITLE files/folders not deleted. "\
                    "Path not found: $CYAN$APPSETTINGSDIR$ENDCOLOR"
        fi
    else
        echo
        echo -e "$YELLOW--->Keeping $APPTITLE files/folders in "\
                "$CYAN$APPSETTINGSDIR$YELLOW...$ENDCOLOR"
    fi
fi

if [[ -f $APPSETTINGS ]] && [[ -z $CI ]]; then
    FOUND=1
    echo -e "${GREEN}Do you want to keep the following $APPTITLE"\
            "settings file for reinstalling later?$ENDCOLOR"
    echo -e "File to be kept: $CYAN$APPSETTINGS$ENDCOLOR"
    read -r -p "Type y/Y to keep or any other key to delete, and press [ENTER] : "
    FILEDEL2=${REPLY,,}

    if [[ $FILEDEL2 != "y" ]]; then
        echo
        if [[ -f $APPSETTINGS ]]; then
            echo -e "$YELLOW--->Deleting $APPTITLE deleting settings file"\
                    "from $CYAN$APPSETTINGS$YELLOW...$ENDCOLOR"
            sudo rm "$APPSETTINGS"
            echo 'OK'
        else
            echo -e "$RED--->$APPTITLE settings file not deleted. "\
                    "Path not found: $CYAN$APPSETTINGS$ENDCOLOR"
        fi
    else
        echo
        echo -e "$YELLOW--->Keeping $APPTITLE settings file "\
                "$CYAN$APPSETTINGS$YELLOW...$ENDCOLOR"
    fi
fi

if [[ $FOUND = 0 ]]; then
    echo 'No files/folders found to delete'
fi
