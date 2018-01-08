#!/bin/bash
echo
sleep 1
echo -e "${YELLOW}--->Manually updating $APPTITLE...$ENDCOLOR"
cd $APPPATH
git config core.filemode false
git fetch --all
git pull