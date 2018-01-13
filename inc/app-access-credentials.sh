#!/bin/bash
echo
sleep 1

if grep -q "reset.sh" "$SCRIPTPATH/$APPNAME/$APPNAME-menu.sh"; then
    RESETSUPPORT="If you forgot, you may use the AtoMiC $APPTITLE password reset utility."
else
    RESETSUPPORT=''
fi

echo -e "${YELLOW}Your $APPTITLE credentials are...$ENDCOLOR"

if [[ -z $UINAME ]]; then
    echo -e "--->${CYAN}Username: ${RED}Incompatibility. Cannot determine username.$ENDCOLOR"
    if [[ -n $APPDEFAULTUNAME ]]; then
        echo -e "Try default username: $GREEN$APPDEFAULTUNAME$ENDCOLOR$RESETSUPPORT"
    fi
else
    echo -e "--->${CYAN}Username: $GREEN$UINAME$ENDCOLOR"
fi

if [[ -z $UIPASS ]]; then
    echo -e "--->${CYAN}Password: ${RED}Incompatibility. Cannot determine password.$ENDCOLOR"
    if [[ -n $APPDEFAULTPASS ]]; then
        echo -e "Try default Password: $GREEN$APPDEFAULTPASS$ENDCOLOR"
    fi
else
    echo -e "--->${CYAN}Password: $GREEN$UIPASS$ENDCOLOR"
fi

echo

if [[ ! $APPUSESNGINX = 'YES' ]]; then

    ERRORCOUNT=0
    echo -e "${YELLOW}Checking $APPTITLE status...$ENDCOLOR"
    if [[ -f /etc/init.d/$APPINITD ]]; then
        if [[ $(sudo /etc/init.d/$APPINITD status) == *"not running"* ]]; then
            echo -e "$RED$APPTITLE is currently not running and will be inaccessible.$ENDCOLOR"
            echo -e "Start $APPTITLE using the following command: ${CYAN}sudo /etc/init.d/$APPINITD start$ENDCOLOR"
        else
            echo -e "$APPTITLE is running and accessible."
        fi
    else
        ERRORCOUNT=$(( $ERRORCOUNT + 1 ))
    fi

    if  [[ -f /etc/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /lib/systemd/system/$APPSYSTEMD ]] || \
        [[ -f /usr/lib/systemd/system/$APPSYSTEMD ]] || \
        [[ -L /etc/systemd/system/multi-user.target.wants/$APPSYSTEMD ]] ; then

        echo -e "SYSTEMD $APPSYSTEMD found.$ENDCOLOR"
        STATUS=$(systemctl is-active $APPSYSTEMD)
        if [[ $STATUS = 'active' ]]; then
            echo -e "$APPSYSTEMD is currently: ${GREEN}$STATUS$ENDCOLOR"
        else
            echo -e "$APPSYSTEMD is currently: ${RED}$STATUS$ENDCOLOR"
        fi
    else
        ERRORCOUNT=$(( $ERRORCOUNT + 1 ))
    fi

    if [[ $ERRORCOUNT = 2 ]]; then
    echo -e "${RED}No boot script found.$ENDCOLOR"
    fi
fi
