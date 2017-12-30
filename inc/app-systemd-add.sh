#!/bin/bash
echo

if [[ -n $APPSYSTEMDLOC || -n $APPSYSTEMDLOC2 || -n $APPSYSTEMDOVERIDE ]]; then
    echo -e "${YELLOW}--->Enabling $APPTITLE Autostart at Boot...$ENDCOLOR"
fi

# If APPSYSTEMDLOC not set then the systemd file is built into the install of the app.

if [[ -n $APPSYSTEMDLOC ]]; then
    sudo cp "$APPSYSTEMDLOC" /etc/systemd/system/$APPSYSTEMD \
    || { echo -e "${RED}Creating systemd file failed.$ENDCOLOR" ; exit 1; }

    sudo chmod 644 "/etc/systemd/system/$APPSYSTEMD" \
    || { echo -e "${RED}Chmod on /etc/systemd/system/$APPSYSTEMD failed.$ENDCOLOR"; exit 1; }

    sudo systemctl enable $APPSYSTEMD
    echo "$APPSYSTEMD SystemD script added and enabled"
fi

if [[ -n $APPSYSTEMDLOC2 ]]; then
    sudo cp "$APPSYSTEMDLOC2" "/etc/systemd/system/$APPSYSTEMD2" \
    || { echo -e "${RED}Creating second systemd file failed.$ENDCOLOR" ; exit 1; }

    sudo chmod 644 "/etc/systemd/system/$APPSYSTEMD2" \
    || { echo -e "${RED}Chmod on /etc/systemd/system/$APPSYSTEMD2 failed.$ENDCOLOR"; exit 1; }

    sudo systemctl enable "$APPSYSTEMD2"
    echo "$APPSYSTEMD2 SystemD script added and enabled"
fi

# Some apps require an override to prevent the systemd file getting overwritten
if [[ -n $APPSYSTEMDOVERIDE ]]; then

    APPSYSTEMDOVERIDELOC="/etc/systemd/system/$APPNAME.service.d"
    if [[ ! -d $APPSYSTEMDOVERIDELOC ]]; then
        sudo mkdir -p "$APPSYSTEMDOVERIDELOC" \
        || { echo -e "${RED}Make dir $APPSYSTEMDOVERIDELOC failed.$ENDCOLOR"; exit 1; }
    fi

    sudo cp -R "$APPSYSTEMDOVERIDE" \
    "/etc/systemd/system/$APPNAME.service.d/override.conf" \
    || { echo -e "${RED}Creating systemd override file failed.$ENDCOLOR" ; exit 1; }

    sudo chmod -R 644 "$APPSYSTEMDOVERIDELOC" \
    || { echo -e "${RED}Chmod on $APPSYSTEMDOVERIDELOC failed.$ENDCOLOR"; exit 1; }

    echo "$APPSYSTEMD SystemD override script added"
fi
