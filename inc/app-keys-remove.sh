#!/bin/bash
echo
echo -e $YELLOW"--->Removing $APPTITLE Keys..."$ENDCOLOR

if [[ -n $REPRECVKEYSGPG ]]; then
    gpg2 --batch --delete-keys $REPRECVKEYS
elif [[ -n $(apt-key list $REPRECVKEYSHORT) ]]; then
    sudo apt-key del $REPRECVKEYSHORT
else
    echo "$APPTITLE key doesn't exist"
fi
