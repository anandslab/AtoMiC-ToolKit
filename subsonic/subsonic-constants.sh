#!/bin/bash

APPNAME='subsonic'
APPSHORTNAME='sub'
APPPATH='/var/subsonic'
APPTITLE='Subsonic'
APPDPORT='4040'
APPSETTINGS=$APPPATH'/subsonic.properties'
ACCESSHOST='NA'
PORTSEARCH='Port='
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='subsonic.service'
APPINITD='subsonic'
APPSYSTEMDLOC=$SCRIPTPATH'/subsonic/'$APPSYSTEMD
