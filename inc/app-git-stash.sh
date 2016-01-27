#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Git stashing any local changes made to '$APPTITLE'...'$ENDCOLOR
cd $APPPATH
git config user.email “atomic@htpcbeginner.com”
git config user.name “AtoMiCUser”
git stash
git stash clear
