#!/bin/bash
# shellcheck disable=SC2034
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
APPSYSTEMDLOC=$SCRIPTPATH'/subsonic/'$APPSYSTEMD
