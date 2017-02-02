#!/bin/bash
# Script Name: AtoMiC NZBHydra default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

## NH_USER=         # username to run nzbhydra under, the default is nzbhydra
sudo sed -i "s@## NH_USER=@NH_USER=$UNAME@g" /etc/default/$APPNAME || { echo -e $RED'Replacing NH_USER failed.'$ENDCOLOR ; exit 1; }

## NH_HOME=         # the location of nzbhydra.py, the default is /opt/nzbhydra
sudo sed -i "s@## NH_HOME=@NH_HOME=$APPPATH@g" /etc/default/$APPNAME || { echo -e $RED'Replacing NH_HOME failed.'$ENDCOLOR ; exit 1; }

## NH_CONFIG=       # the path to settings file, the default is $NH_HOME/settings.cfg
sudo sed -i "s@## NH_CONFIG=@NH_CONFIG=$APPSETTINGS@g" /etc/default/$APPNAME || { echo -e $RED'Replacing ENABLE_DAEMON failed.'$ENDCOLOR ; exit 1; }
