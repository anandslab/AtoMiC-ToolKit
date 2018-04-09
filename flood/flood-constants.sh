#!/bin/bash

APPNAME='flood'
APPTITLE='Flood'
APPSHORTNAME='fl'
APPPATH='/opt/flood'
APPGIT='https://github.com/jfurrow/flood.git'
APPSETTINGS="$APPPATH/config.js"
NPMDEPS='node-gyp argon2'
APPDPORT='3000'
ACCESSHOST='NA'
PORTSEARCH='floodServerPort: '
APPSYSTEMD='flood.service'
APPSYSTEMDLOC="$SCRIPTPATH/flood/$APPSYSTEMD"
APPINITD='flood'
APPINITDLOC="$SCRIPTPATH/flood/flood.init"
