#!/bin/bash

APPNAME='ubooquity'
APPSHORTNAME='uq'
APPPATH='/opt/ubooquity'
APPTITLE='Ubooquity'
APPDPORT='2203/admin'
APPSETTINGS="$APPPATH/preferences.json"
ACCESSHOST='NA'
PORTSEARCH='libraryPortNumber'
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='ubooquity.service'
APPSYSTEMDLOC="$SCRIPTPATH/ubooquity/$APPSYSTEMD"
APPINITD='ubooquity'
APPINITDLOC="$SCRIPTPATH/$APPNAME/$APPNAME.init"
PROXYREQSUFFIX='NO'
