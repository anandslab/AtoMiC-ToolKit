#!/bin/bash
echo
echo -e $YELLOW"--->Adding $APPTITLE Keys..."$ENDCOLOR
if [[ -n $REPRECVKEYSASC ]]; then
    wget -qO - $REPRECVKEYSASC | sudo apt-key add -
elif [[ -n $REPRECVKEYSGPG ]]; then
    gpg2 --recv-keys $REPRECVKEYS
else
    sudo apt-key adv --keyserver $REPKEYSERVER --recv-keys $REPRECVKEYS
fi
