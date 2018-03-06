#!/bin/bash
# Script Name: AtoMiC Mylar default update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com


echo -e "${YELLOW}--->Updating Default file...$ENDCOLOR"

#$RUN_AS, username to run mylar under, the default is mylar
sudo sed -i "s@MYLAR_USER=@MYLAR_USER=$UNAME@g" /etc/default/$APPNAME || { echo -e $RED'Replacing MYLAR_USER failed.'$ENDCOLOR ; exit 1; }

#$APP_PATH, the location of mylar.py, the default is /opt/mylar
sudo sed -i "s@MYLAR_HOME=@MYLAR_HOME=$APPPATH@g" /etc/default/$APPNAME || { echo -e $RED'Replacing MYLAR_HOME failed.'$ENDCOLOR ; exit 1; }

#$DATA_DIR, the location of mylar.db, cache, logs, the default is /opt/mylar
sudo sed -i "s@MYLAR_DATA=@MYLAR_DATA=$APPPATH/data@g" /etc/default/$APPNAME || { echo -e $RED'Replacing MYLAR_DATA failed.'$ENDCOLOR ; exit 1; }

#$EXTRA_DAEMON_OPTS, extra cli option for mylar, i.e. " --config=/home/mylar/config.ini"
sudo sed -i "s@MYLAR_OPTS=@MYLAR_OPTS=--config=$APPSETTINGS@g" /etc/default/$APPNAME || { echo -e $RED'Replacing MYLAR_OPTS failed.'$ENDCOLOR ; exit 1; }
