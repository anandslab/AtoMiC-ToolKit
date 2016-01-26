#!/bin/bash
echo
sleep 1
echo -e $YELLOW'--->Manually updating '$APPTITLE'...'$ENDCOLOR
cd $APPPATH
git fetch --all
git pull