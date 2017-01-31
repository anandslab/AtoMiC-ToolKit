#!/bin/bash
# Script Name: AtoMiC SickGear default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

#$RUN_AS, username to run sickrage under, the default is sickrage
sudo sed -i "s@SG_USER=@SG_USER=$UNAME@g" /etc/default/$APPNAME || { echo -e $RED'Replacing RUN_AS failed.'$ENDCOLOR ; exit 1; }

#$APP_PATH, the location of SickBeard.py, the default is /opt/sickrage
sudo sed -i "s@SG_HOME=@SG_HOME=$APPPATH@g" /etc/default/$APPNAME || { echo -e $RED'Replacing RUN_AS failed.'$ENDCOLOR ; exit 1; }

#$DATA_DIR, the location of sickbeard.db, cache, logs, the default is /opt/sickrage
sudo sed -i "s@SG_DATA=@SG_DATA=$APPPATH/data@g" /etc/default/$APPNAME || { echo -e $RED'Replacing DATADIR failed.'$ENDCOLOR ; exit 1; }
