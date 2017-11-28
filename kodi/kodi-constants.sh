#!/bin/bash
# shellcheck disable=SC2034
APPNAME='kodi'
APPSHORTNAME='kodi'
APPTITLE='Kodi'
APPDEPS='sndiod kodi-pvr-mythtv kodi-pvr-vuplus kodi-pvr-vdr-vnsi kodi-pvr-njoy kodi-pvr-nextpvr kodi-pvr-mediaportal-tvserver kodi-pvr-tvheadend-hts kodi-pvr-dvbviewer kodi-pvr-argustv kodi-pvr-iptvsimple kodi-audioencoder-vorbis kodi-audioencoder-flac kodi-audioencoder-lame'
APPSYSTEMD='kodi.service'
APPSYSTEMDLOC=$SCRIPTPATH/$APPNAME/$APPSYSTEMD
APPINITD='kodi'
APPINITDLOC=$SCRIPTPATH/$APPNAME'/kodi.init'
