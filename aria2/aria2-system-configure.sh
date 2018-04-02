#!/bin/bash
# Script Name: AtoMiC Aria2 system configure

if cp "$SCRIPTPATH/aria2/aria2.daemon" "/home/$UNAME/.config/aria2/aria2.daemon" || \
    { echo -e "${RED}Copy aria2.daemon file failed.$ENDCOLOR" ; exit 1; }; then
    echo "aria2.daemon file copied over"
fi

sudo sed -i "s@UNAME@$UNAME@g" "/home/$UNAME/.config/aria2/aria2.daemon" || { echo -e "${RED}Modifying PATH in SYSTEMD file failed.$ENDCOLOR"; exit 1; }
