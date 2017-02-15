#!/bin/bash
echo
if [ ! "$APPREPOSITORYLINK" == "" ]; then

    echo -e $YELLOW"--->Adding $APPTITLE repository..."$ENDCOLOR
    if ! grep -rq "$APPREPOSITORYLINK" /etc/apt; then
        if [ "$REPOPPA" = 'YES' ]; then
            sudo add-apt-repository -y $APPREPOSITORYLINK
        else
            echo "$APPREPOSITORYLINK" | sudo tee -a /etc/apt/sources.list.d/$APPREPOSITORYNAME.list
            
            if ! grep -rq "$APPREPOSITORYLINK" /etc/apt; then
                if [[ $APPREPOSITORYLINKBACKUP != "" ]]; then
                    echo "$APPREPOSITORYLINKBACKUP" | sudo tee -a /etc/apt/sources.list.d/$APPREPOSITORYNAME.list
                fi
            fi

            if [ "$REPOKEYSREQ" = 'YES' ]; then
                source $SCRIPTPATH/inc/app-keys-add.sh
            fi
        fi
    else
        echo "$APPTITLE repository already exists"
    fi
fi
