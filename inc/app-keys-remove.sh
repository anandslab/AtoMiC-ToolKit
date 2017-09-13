#!/bin/bash
echo
echo -e $YELLOW"--->Removing $APPTITLE Keys..."$ENDCOLOR

if [[ -n $REPRECVKEYSGPG ]]; then
    su -c "gpg2 --batch --delete-keys $REPRECVKEYS" $UNAME
elif [[ -n $(apt-key list $REPRECVKEYSHORT) ]]; then
    sudo apt-key del $REPRECVKEYSHORT
else
    echo "$APPTITLE key doesn't exist"
fi
