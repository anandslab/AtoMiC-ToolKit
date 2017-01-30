#!/bin/bash
APPNAME='headphones'
APPSHORTNAME='hp'
APPPATH='/opt/headphones'
APPTITLE='Headphones'
APPPIDFILE='var/run/headphones/headphones.pid'
APPDEPS='git python python-cheetah python-pyasn1'
APPGIT='https://github.com/rembo10/headphones.git'
APPDPORT='8181'
APPSETTINGS=$APPPATH'/headphones.ini'
ACCESSHOST='http_host = '
PORTSEARCH='http_port = '
USERSEARCH='http_username = '
PASSSEARCH='http_password = '
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='headphones.service'
APPSYSTEMDLOC=$SCRIPTPATH'/headphones/'$APPSYSTEMD
APPINITDLOC=$SCRIPTPATH'/headphones/headphones.initd'
APPDEFAULTLOC=$SCRIPTPATH'/headphones/headphones.default'
