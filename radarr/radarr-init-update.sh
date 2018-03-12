#!/bin/bash
# Script Name: AtoMiC Radarr init.d update

echo 'Updating init.d file'

sudo sed -i "s@RUNASUSER=root@RUNASUSER=$UNAME@g" /etc/init.d/$APPINITD || { echo -e $RED'Replacing RUN_AS failed.'$ENDCOLOR ; exit 1; }
sudo sed -i "s@RUNASGROUP=root@RUNASGROUP=$UGROUP@g" /etc/init.d/$APPINITD || { echo -e $RED'Replacing RUNASGROUP failed.'$ENDCOLOR ; exit 1; }
