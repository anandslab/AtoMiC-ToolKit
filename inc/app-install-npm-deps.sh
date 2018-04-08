#!/bin/bash

echo
sleep 1
echo -e "${YELLOW}--->Installing prerequisites for $APPTITLE...$ENDCOLOR"
sudo -u "$UNAME" npm install -g $NPMDEPS # Careful trying to quote this
