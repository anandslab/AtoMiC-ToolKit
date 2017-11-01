#!/bin/bash
# shellcheck disable=SC2034
APPNAME='lazylibrarian'
APPSHORTNAME='ll'
APPPATH='/opt/lazylibrarian'
APPTITLE='Lazy Librarian'
APPPIDFILE='/var/run/lazylibrarian/lazylibrarian.pid'
APPDEPS='python python-pip python-dev libssl-dev libffi-dev'
APPPIPS='cryptography requests[security]'
APPGIT='https://github.com/DobyTang/LazyLibrarian.git'
APPDPORT='5299'
APPSETTINGS=$APPPATH'/lazylibrarian.ini'
ACCESSHOST='http_host = '
PORTSEARCH='http_port = '
USERSEARCH='http_user = '
PASSSEARCH='http_pass = '
# New password encrypted
NEWPASS='atomic'
# New password unencrypted
APPNEWPASS='atomic'
APPSYSTEMD='lazylibrarian.service'
APPSYSTEMDLOC=$APPPATH'/init/'$APPSYSTEMD
APPINITD='lazylibrarian'
APPINITDLOC=$APPPATH'/init/lazylibrarian.initd'
APPDEFAULTLOC=$APPPATH'/init/lazylibrarian.default'
