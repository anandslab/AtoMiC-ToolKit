#!/bin/bash
# Script Name: AtoMiC FileBot Installer

source "$SCRIPTPATH/inc/header.sh"
echo -e "${GREEN}AtoMiC $APPTITLE Installer Script$ENDCOLOR"

if IsSystemdSupported; then
    source "$SCRIPTPATH/inc/pause.sh"
    source "$SCRIPTPATH/inc/app-install-deps.sh"
    echo
    echo -e "$YELLOW--->Installing snap $APPTITLE package...$ENDCOLOR"

    if [[ -d $APPPATH ]]; then
        echo "$APPTITLE already installed"
        echo
    else
        if snap install "$APPNAME"; then
            source "$SCRIPTPATH/inc/app-install-confirmation.sh"
            source "$SCRIPTPATH/utils/filebot/filebot-patron.sh"
        else
            echo -e "${RED}Linux Distro not currently supported.$ENDCOLOR"
        fi
    fi
else
    echo -e "${RED}Linux Distro not currently supported." \
                "Please consider upgrading to a newer version$ENDCOLOR"
fi
