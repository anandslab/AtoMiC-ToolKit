#!/bin/bash
# Script Name: AtoMiC PlexPy default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#
#$HP_USER, username to run PlexPy under, the default is PlexPy
sudo sed -i "s@HP_USER=@HP_USER=$UNAME@g" /etc/default/$APPNAME || { echo -e $RED'Replacing HP_USER failed.'$ENDCOLOR ; exit 1; }

# #$APP_PATH, the location of PlexPy.py, the default is /opt/PlexPy
# sudo sed -i "s@HP_HOME=@HP_HOME=$APPPATH@g" /etc/default/$APPNAME || { echo -e $RED'Replacing HP_HOME failed.'$ENDCOLOR ; exit 1; }
# #$HP_DATA, the location of PlexPy.db, cache, logs, the default is /opt/PlexPy
# sudo sed -i "s@HP_DATA=@HP_DATA=$APPPATH/data@g" /etc/default/$APPNAME || { echo -e $RED'Replacing HP_DATA failed.'$ENDCOLOR ; exit 1; }
