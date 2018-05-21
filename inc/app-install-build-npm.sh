#!/bin/bash

echo
cd "$APPPATH" || exit
if sudo -u "$UNAME" npm install; then
    echo "Installed $APPTITLE npm package"
else
    echo -e "${RED}Installing $APPTITLE Failed$ENDCOLOR"; exit 1
fi

if sudo -u "$UNAME" npm run build; then
    echo "Built $APPTITLE npm package"
else
    echo -e "${RED}Building $APPTITLE Failed$ENDCOLOR"; exit 1
fi

cd "$SCRIPTPATH" || exit
