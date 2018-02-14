#!/bin/bash
# shellcheck disable=SC2034
APPNAME='syncthing'
APPSHORTNAME='sc'
APPTITLE='Syncthing'
APPDEPS='syncthing-inotify'
APPPATH="/home/$UNAME/.config/syncthing"
APPSETTINGS="$APPPATH/config.xml"
APPREPOSITORYNAME='syncthing'
REPRECVKEYSASC='https://syncthing.net/release-key.txt'
REPRECVKEYSHORT='00654A3E'
REPRECVKEYS='D26E6ED000654A3E'
REPOPPA='NO'
APPREPOSITORYLINK='deb https://apt.syncthing.net/ syncthing stable'
REPOKEYSREQ='YES'
APPDPORT='8384'
USERSEARCH="NA"
PASSSEARCH='NA'
ACCESSHOST='        <address>'
APPSYSTEMD="syncthing@$UNAME.service"
APPSYSTEMD2="syncthing-inotify@$UNAME.service"
APPINITD='syncthing'
APPINITD2='syncthing-inotify'
APPINITDLOC=$SCRIPTPATH'/syncthing/syncthing.init'
APPINITDLOC2=$SCRIPTPATH'/syncthing/syncthing-inotify.init'
PROXYREQSUFFIX='NO'
if [[ -f $APPSETTINGS ]]; then
    IPSTRING=$(grep -o -P '(?<=<address>).*(?=:)' $HOME/.config/syncthing/config.xml)
    PORTSEARCH="$IPSTRING:"
fi
