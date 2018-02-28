#!/bin/bash
echo
sleep 1
echo -e "${YELLOW}--->Manually updating $APPTITLE...$ENDCOLOR"
cd $APPPATH || exit
git config core.filemode false
git fetch --all
git pull
cd $SCRIPTPATH || exit
