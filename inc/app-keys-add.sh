#!/bin/bash
echo
echo -e $YELLOW"--->Adding $APPTITLE Keys..."$ENDCOLOR
if [[ $REPRECVKEYSASC != "" ]]; then
    wget -qO - $REPRECVKEYSASC | sudo apt-key add -
else
    sudo apt-key adv --keyserver $REPKEYSERVER --recv-keys $REPRECVKEYS
fi
