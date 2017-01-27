#!/bin/bash
echo
echo -e $YELLOW"--->Removing $APPTITLE Keys..."$ENDCOLOR
sudo apt-key del $REPRECVKEYSHORT
