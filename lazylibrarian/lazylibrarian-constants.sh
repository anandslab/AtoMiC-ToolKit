#!/bin/bash
APPNAME='lazylibrarian'
APPSHORTNAME='ll'
APPPATH='/opt/lazylibrarian'
APPTITLE='Lazy Librarian'
APPPIDFILE='/var/run/lazylibrarian/lazylibrarian.pid'
APPDEPS='git python'
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
APPINITDLOC=$APPPATH'/init/ubuntu.initd'
APPDEFAULTLOC=$APPPATH'/init/ubuntu.default'
