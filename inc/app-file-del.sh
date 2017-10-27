#!/bin/bash
echo
sleep 1

echo -e "${YELLOW}--->Removing $APPTITLE files/folders...$ENDCOLOR"

FOUND=0
if [[ -d $APPPATH ]]; then
    FOUND=1
    if [[ -z $CI ]]; then
        echo -e "${GREEN}Do you want to keep the following $APPTITLE"\
                "settings/data folder for reinstalling later?$ENDCOLOR"
        echo -e "Folder to be kept: $CYAN$APPPATH$ENDCOLOR"
        read -r -p "Type y/Y to keep or any other key to delete, and press [ENTER] : "
        FILEDEL=${REPLY,,}
    fi

    if [[ $FILEDEL != "y" ]]; then
        echo
        if [[ -d $APPPATH ]]; then
            echo -e "$YELLOW--->Deleting $APPTITLE"\
                    "files/folders from $CYAN$APPPATH$YELLOW...$ENDCOLOR"
            sudo rm -r "$APPPATH"
            echo 'OK'
        fi
    else
        echo
        echo -e "$YELLOW--->Keeping $APPTITLE files/folders in "\
                "$CYAN$APPPATH$YELLOW...$ENDCOLOR"
    fi
fi

if [[ -d $APPSETTINGSDIR ]]; then
    FOUND=1
    if [[ -z $CI ]]; then
        echo -e "${GREEN}Do you want to keep the following $APPTITLE"\
                "settings/data folder for reinstalling later?$ENDCOLOR"
        echo -e "Folder to be kept: $CYAN$APPSETTINGSDIR$ENDCOLOR"
        read -r -p "Type y/Y to keep or any other key to delete, and press [ENTER] : "
        FILEDEL2=${REPLY,,}
    fi

    if [[ $FILEDEL2 != "y" ]]; then
        echo
        if [[ -d $APPSETTINGSDIR ]]; then
            echo -e "$YELLOW--->Deleting $APPTITLE files/folders"\
                    "from $CYAN$APPSETTINGSDIR$YELLOW...$ENDCOLOR"
            sudo rm -r "$APPSETTINGSDIR"
            echo 'OK'
        fi
    else
        echo
        echo -e "$YELLOW--->Keeping $APPTITLE files/folders in "\
                "$CYAN$APPSETTINGSDIR$YELLOW...$ENDCOLOR"
    fi
fi

if [[ -f $APPSETTINGS ]]; then
    FOUND=1
    if [[ -z $CI ]]; then
        echo -e "${GREEN}Do you want to keep the following $APPTITLE"\
                "settings file for reinstalling later?$ENDCOLOR"
        echo -e "File to be kept: $CYAN$APPSETTINGS$ENDCOLOR"
        read -r -p "Type y/Y to keep or any other key to delete, and press [ENTER] : "
        FILEDEL3=${REPLY,,}
    fi

    if [[ $FILEDEL3 != "y" ]]; then
        echo
        if [[ -f $APPSETTINGS ]]; then
            echo -e "$YELLOW--->Deleting $APPTITLE deleting settings file"\
                    "from $CYAN$APPSETTINGS$YELLOW...$ENDCOLOR"
            sudo rm "$APPSETTINGS"
            echo 'OK'
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
