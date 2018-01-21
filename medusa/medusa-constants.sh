#!/bin/bash
# shellcheck disable=SC2034
APPNAME='medusa'
APPSHORTNAME='md'
APPPATH='/opt/medusa'
APPTITLE='Medusa'
APPGIT='https://github.com/pymedusa/Medusa.git'
APPDPORT='8081'
APPSETTINGS=$APPPATH'/config.ini'
ACCESSHOST='web_host = '
PORTSEARCH='web_port = '
USERSEARCH='web_username = '
PASSSEARCH='web_password = '
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='medusa.service'
APPSYSTEMDLOC=$APPPATH'/runscripts/init.systemd'
APPINITD='medusa'
APPINITDLOC=$APPPATH'/runscripts/init.debian'
APPDEFAULTLOC=$SCRIPTPATH'/medusa/medusa.default'
