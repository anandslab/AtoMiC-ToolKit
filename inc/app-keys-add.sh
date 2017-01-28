#!/bin/bash
echo
echo -e $YELLOW"--->Adding $APPTITLE Keys..."$ENDCOLOR
sudo apt-key adv --keyserver $REPKEYSERVER --recv-keys $REPRECVKEYS
