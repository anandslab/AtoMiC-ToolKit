#!/bin/bash
# Script Name: AtoMiC Kodi enable Launch on boot

source "$SCRIPTPATH/inc/app-autostart-configure.sh"
APPDEPS='xorg dbus-x11 xserver-xorg-legacy'
source "$SCRIPTPATH/inc/app-install-deps.sh"
dpkg-reconfigure x11-common  >/dev/null 2>&1
sudo sed -i '/allowed_users/c\allowed_users=anybody' /etc/X11/Xwrapper.config || { echo -e $RED'Adding allowed_users in Xwrapper.config file failed.'$ENDCOLOR; exit 1; }
if ! grep -qF 'needs_root_rights=yes' /etc/X11/Xwrapper.config; then
    echo 'needs_root_rights=yes' >> /etc/X11/Xwrapper.config
    echo
fi

source "$SCRIPTPATH/inc/pause.sh"
