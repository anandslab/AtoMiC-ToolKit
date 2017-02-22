#!/bin/bash
echo
sleep 1
echo -e $YELLOW"--->Enabling $APPTITLE Autostart at Boot..."$ENDCOLOR

# If APPSYSTEMDLOC not set then the systemd file is built into the install of the app.

if [[ ! -z $APPSYSTEMDLOC ]]; then
    sudo cp "$APPSYSTEMDLOC" /etc/systemd/system/$APPSYSTEMD || { echo -e $RED'Creating systemd file failed.'$ENDCOLOR ; exit 1; }
    sudo chmod 644 /etc/systemd/system/$APPSYSTEMD
    sudo systemctl enable $APPSYSTEMD
    echo "$APPSYSTEMD SystemD script added and enabled"
fi

# Some apps require an override to prevent the systemd file getting overwritten
if [[ ! -z $APPSYSTEMDOVERIDE ]]; then
    sudo cp "$APPSYSTEMDOVERIDE" /etc/systemd/system/$APPNAME.service.d/override.conf || { echo -e $RED'Creating systemd override file failed.'$ENDCOLOR ; exit 1; }
    sudo chmod 644 /etc/systemd/system/$APPNAME.service.d/override.conf
    echo "$APPSYSTEMD SystemD override script added"
fi
