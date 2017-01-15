#!/bin/bash
APPNAME='headphones'
APPSHORTNAME='hp'
APPPATH='/home/'$UNAME'/.headphones'
APPTITLE='Headphones'
APPDEPS='git-core python python-cheetah python-pyasn1'
APPGIT='https://github.com/rembo10/headphones.git'
APPDPORT='8181'
APPSETTINGS=$APPPATH'/config.ini'
PORTSEARCH='http_port = '
USERSEARCH='http_username = '
PASSSEARCH='http_password = '
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPINITDLOC=$APPPATH'/init-scripts/init.ubuntu'
