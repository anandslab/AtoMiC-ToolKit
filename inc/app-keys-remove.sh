#!/bin/bash
echo
echo -e $YELLOW"--->Removing $APPTITLE Keys..."$ENDCOLOR

if [[ -n $(apt-key list $REPRECVKEYSHORT) ]]; then
    sudo apt-key del $REPRECVKEYSHORT
else
    echo "$APPTITLE key doesn't exist"
fi
