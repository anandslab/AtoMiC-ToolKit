#!/bin/bash
# shellcheck disable=SC1090
echo
echo -e "${YELLOW}--->configuring NGIX for $APPTITLE...$ENDCOLOR"
if [[ -d $APPPATH ]]; then

    # Stop Nginx
    APPNAMETEMP=$APPNAME
    APPNAME='nginx'
    source "$SCRIPTPATH/inc/app-stop.sh"
    APPNAME=$APPNAMETEMP

    sudo chown -R www-data:www-data "$APPPATH"
    echo "Set the correct folder permissions"

    cp "$SCRIPTPATH/$APPNAME/$APPNAME-nginx" \
        "/etc/nginx/sites-available/$APPNAME" || \
        { echo "Could not move $APPSETTINGS file." ; exit 1; }
    echo "Copied config file over"

    if [[ ! -f "/etc/nginx/sites-enabled/$APPNAME" ]]; then
        sudo ln -s "/etc/nginx/sites-available/$APPNAME" \
                    "/etc/nginx/sites-enabled/$APPNAME"
        echo "Symlinked the muxmix virtual host"
    fi

    # Start Nginx
    APPNAMETEMP=$APPNAME
    APPNAME='nginx'
    source "$SCRIPTPATH/inc/app-start.sh"
    APPNAME=$APPNAMETEMP
else
    echo "No application path found for $APPTITLE"
fi