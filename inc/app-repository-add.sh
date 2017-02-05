#!/bin/bash
echo
if [ ! "$APPREPOSITORYLINK" == "" ]; then

    echo -e $YELLOW"--->Adding $APPTITLE repository..."$ENDCOLOR
    GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep $APPREPOSITORYNAME)
    if [ "$GREPOUT" == "" ]; then
        if [ "$REPOPPA" = 'YES' ]; then
            sudo add-apt-repository -y $APPREPOSITORYLINK
        else
            echo "$APPREPOSITORYLINK" | sudo tee -a /etc/apt/sources.list.d/$APPNAME.list

            if [[ $APPREPOSITORYLINKBACKUP != "" ]]; then
                echo "$APPREPOSITORYLINKBACKUP" | sudo tee -a /etc/apt/sources.list.d/$APPNAME.list
            fi

            if [ "$REPOKEYSREQ" = 'YES' ]; then
                source $SCRIPTPATH/inc/app-keys-add.sh
            fi
        fi
    else
        echo "$APPTITLE repository already exists"
    fi
fi
