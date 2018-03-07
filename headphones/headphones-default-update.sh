#!/bin/bash
# Script Name: AtoMiC Headphones default update

echo -e "${YELLOW}--->Updating Default file...$ENDCOLOR"

# [optional] change to 1 to enable daemon
sudo sed -i 's@ENABLE_DAEMON=0@ENABLE_DAEMON=1@g' /etc/default/$APPNAME || { echo -e $RED'Replacing ENABLE_DAEMON failed.'$ENDCOLOR ; exit 1; }

# [required] user or uid of account to run the program as:
sudo sed -i "s@RUN_AS=@RUN_AS=$UNAME@g" /etc/default/$APPNAME || { echo -e $RED'Replacing RUN_AS failed.'$ENDCOLOR ; exit 1; }

# [optional] full path to the configuration file of your choice;
sudo sed -i "s@CONFIG=@CONFIG=$APPSETTINGS@g" /etc/default/$APPNAME || { echo -e $RED'Replacing CONFIG failed.'$ENDCOLOR ; exit 1; }

# [optional] full path to the folder to store data (databases/thumbs) in;
sudo sed -i "s@DATADIR=@DATADIR=$APPPATH/data@g" /etc/default/$APPNAME || { echo -e $RED'Replacing DATADIR failed.'$ENDCOLOR ; exit 1; }

# [optional] full path for the pidfile
sudo sed -i "s@PID_FILE=@PID_FILE=$APPPIDFILE@g" /etc/default/$APPNAME || { echo -e $RED'Replacing PID_FILE failed.'$ENDCOLOR ; exit 1; }

echo 'Updated Default file with new values'
