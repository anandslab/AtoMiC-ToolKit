#!/bin/bash

APPNAME='aria2'
APPSHORTNAME='a2'
APPPATH='/usr/share/doc/aria2'
APPTITLE='Aria2'
APPDOWNLOADURL='https://api.github.com/repos/q3aql/aria2-static-builds/releases/latest'
APPDOWNLOADSTRIP='--strip-components=1'
ACCESSHOST='NA'
APPSETTINGSDIR="/home/$UNAME/.config/aria2"
APPSETTINGS="$APPSETTINGSDIR/aria2.conf"
APPSYSTEMD='aria2.service'
APPSYSTEMDLOC="$SCRIPTPATH/$APPNAME/$APPSYSTEMD"
APPINITD='aria2'
APPINITDLOC="$SCRIPTPATH/$APPNAME/$APPINITD.init"
