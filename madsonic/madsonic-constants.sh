#!/bin/bash
# shellcheck disable=SC2034
APPNAME='madsonic'
APPSHORTNAME='sub'
APPPATH='/var/madsonic'
APPTITLE='Madsonic'
APPDPORT='4040'
APPSETTINGS=$APPPATH'/madsonic.properties'
ACCESSHOST='NA'
PORTSEARCH='Port='
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='madsonic.service'
APPINITD='madsonic'
APPSYSTEMDLOC=$SCRIPTPATH'/madsonic/'$APPSYSTEMD
