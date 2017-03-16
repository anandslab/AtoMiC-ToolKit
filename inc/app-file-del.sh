#!/bin/bash
echo
sleep 1

if [ -d "$APPPATH" ]; then
    echo -e $GREEN"Do you want to keep the following $APPTITLE settings / data folder for reinstalling later?"$ENDCOLOR
    echo -e 'Folder to be kept: '$CYAN$APPPATH$ENDCOLOR
    read -p 'Type y/Y to keep or any other key to delete, and press [ENTER] : '
    FILEDEL=${REPLY,,}

    if [ "$FILEDEL" != "y" ] 
    then
        echo
        if [ -d "$APPPATH" ]; then
            echo -e $YELLOW"--->Deleting $APPTITLE files/folders from $CYAN$APPPATH$YELLOW..."$ENDCOLOR
            sudo rm -r $APPPATH
            echo 'OK'
        else
            echo -e $RED"--->$APPTITLE files/folders not deleted. Path not found: "$CYAN$APPPATH$ENDCOLOR
        fi
    else
        echo
        echo -e $YELLOW"--->Keeping $APPTITLE files/folders in $CYAN$APPPATH$YELLOW..."$ENDCOLOR
    fi
fi

if [ -d "$APPSETTINGSDIR" ]; then
    echo -e $GREEN"Do you want to keep the following $APPTITLE settings / data folder for reinstalling later?"$ENDCOLOR
    echo -e 'Folder to be kept: '$CYAN$APPSETTINGSDIR$ENDCOLOR
    read -p 'Type y/Y to keep or any other key to delete, and press [ENTER] : '
    FILEDEL2=${REPLY,,}

    if [ "$FILEDEL2" != "y" ] 
    then
        echo
        if [ -d "$APPSETTINGSDIR" ]; then
            echo -e $YELLOW"--->Deleting $APPTITLE files/folders from $CYAN$APPSETTINGSDIR$YELLOW..."$ENDCOLOR
            sudo rm -r $APPSETTINGSDIR
            echo 'OK'
        else
            echo -e $RED"--->$APPTITLE files/folders not deleted. Path not found: "$CYAN$APPSETTINGSDIR$ENDCOLOR
        fi
    else
        echo
        echo -e $YELLOW"--->Keeping $APPTITLE files/folders in $CYAN$APPSETTINGSDIR$YELLOW..."$ENDCOLOR
    fi
fi
