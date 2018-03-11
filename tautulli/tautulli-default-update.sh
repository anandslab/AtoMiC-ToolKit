#!/bin/bash
# Script Name: AtoMiC Tautulli default update

#$TAUTULLI_USER, username to run Tautulli under, the default is Tautulli
if sudo sed -i "s@TAUTULLI_USER=@TAUTULLI_USER=$UNAME@g" /etc/default/$APPNAME || \
        { echo -e "${RED}Replacing TAUTULLI_USER failed.$ENDCOLOR" ; exit 1; }; then
    echo -e "Set TAUTULLI_USER to use ${CYAN}$UNAME$ENDCOLOR"
fi
