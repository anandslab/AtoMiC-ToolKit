#!/bin/bash
# Script Name: AtoMiC Medusa default update

echo -e "${YELLOW}--->Updating Default file...$ENDCOLOR"

#$RUN_AS, username to run Medusa under, the default is Medusa
sudo sed -i "s@APP_USER=@APP_USER=$UNAME@g" /etc/default/$APPNAME || { echo -e $RED'Replacing RUN_AS failed.'$ENDCOLOR ; exit 1; }

#$RUN_AS, group to run Medusa under, the default is Medusa
sudo sed -i "s@APP_GROUP=@APP_GROUP=$UGROUP@g" /etc/default/$APPNAME || { echo -e $RED'Replacing RUN_AS failed.'$ENDCOLOR ; exit 1; }

echo 'Updated Default file with new values'
