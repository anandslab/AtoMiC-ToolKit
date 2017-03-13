#!/bin/bash
APPNAME='madsonic'
APPSHORTNAME='sub'
APPPATH='/var/madsonic'
APPTITLE='Madsonic'
APPDEPS='openjdk-8-jre-headless'
APPDPORT='4040'
APPSETTINGS=$APPPATH'/madsonic.properties'
ACCESSHOST='NA'
PORTSEARCH='Port='
USERSEARCH='NA'
PASSSEARCH='NA'
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='madsonic.service'
APPSYSTEMDLOC=$SCRIPTPATH'/madsonic/'$APPSYSTEMD
