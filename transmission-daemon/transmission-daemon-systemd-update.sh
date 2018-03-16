#!/bin/bash
# Script Name: AtoMiC Transmission systemd update

echo
echo -e "$YELLOW--->Updating transmission-daemon.service.d/override.conf to run as $CYAN$UNAME$ENDCOLOR ...$ENDCOLOR"

if sudo sed -i "s@User=ReplaceMe@User=$UNAME@g" /etc/systemd/system/transmission-daemon.service.d/override.conf || \
        { echo -e "${RED}Modifying USER in SYSTEMD file failed.$ENDCOLOR"; exit 1; }; then
    echo -e "Set USER to ${CYAN}$UNAME$ENDCOLOR"
fi

if sudo sed -i "s@Group=ReplaceMe@Group=$UGROUP@g" /etc/systemd/system/transmission-daemon.service.d/override.conf || \
        { echo -e "${RED}Modifying GROUP in SYSTEMD file failed.$ENDCOLOR"; exit 1; }; then
    echo -e "Set GROUP to ${CYAN}$UGROUP$ENDCOLOR"
fi
