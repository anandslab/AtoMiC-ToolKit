#!/bin/bash
echo
sleep 1
echo -e $YELLOW"--->Git stashing any local changes made to $APPTITLE..."$ENDCOLOR
git -C $APPPATH stash
git  -C $APPPATH stash clear
