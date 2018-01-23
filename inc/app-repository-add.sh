#!/bin/bash
echo
if [ ! "$APPREPOSITORYLINK" = "" ]; then
    echo -e "$YELLOW--->Adding $APPTITLE repository...$ENDCOLOR"
    #Check if needed and add
    GREPOUT=$(grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep $APPREPOSITORYNAME)
    if [ "$GREPOUT" = "" ]; then
        if [ "$REPOPPA" = 'YES' ]; then
            sudo add-apt-repository -y $APPREPOSITORYLINK
        else
            #Add the key
            echo "$APPREPOSITORYLINK" | sudo tee -a /etc/apt/sources.list.d/$APPREPOSITORYNAME.list

            #Check if backup required and add if needed
            if [ ! "$APPREPOSITORYLINKBACKUP" = "" ]; then
                if [ "$GREPOUTBACK" = "" ]; then
                    echo "$APPREPOSITORYLINKBACKUP" | sudo tee -a /etc/apt/sources.list.d/$APPREPOSITORYNAME.list
                fi
            fi

            #Add a key if required
            if [ "$REPOKEYSREQ" = 'YES' ]; then
                source "$SCRIPTPATH/inc/app-keys-add.sh"
            fi
        fi
    else
        echo "$APPTITLE repository already exists"
    fi
fi
