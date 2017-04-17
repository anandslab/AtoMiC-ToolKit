#!/bin/bash
# shellcheck disable=SC2034
APPNAME='ubooquity'
APPSHORTNAME='uq'
APPPATH='/opt/ubooquity'
APPTITLE='Ubooquity'
APPDPORT='2202/admin'
APPSETTINGS="$APPPATH/preferences.xml"
ACCESSHOST='NA'
PORTSEARCH='<portNumber>'
USERSEARCH='NA'
PASSSEARCH='NA'
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='ubooquity.service'
APPSYSTEMDLOC="$SCRIPTPATH/ubooquity/$APPSYSTEMD"
APPINITDLOC="$SCRIPTPATH/$APPNAME/$APPNAME.init"