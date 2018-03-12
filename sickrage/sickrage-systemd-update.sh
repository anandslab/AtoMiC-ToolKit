#!/bin/bash
# Script Name: AtoMiC SickRage Systemd Update

sudo sed -i "s@Description=SickRage Daemon@Description=SickRage@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying DESCRIPTION in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@User=sickrage@User=$UNAME@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying USER in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@Group=sickrage@Group=$UGROUP@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying GROUP in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i '/^GuessMainPID=no/a Restart=on-failure' /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Adding RESTART in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@ExecStart=/usr/bin/python2.7 /opt/sickrage/SickBeard.py -q --daemon --nolaunch --datadir=/opt/sickrage@ExecStart=/usr/bin/python $APPPATH/SickBeard.py -q --daemon --nolaunch --datadir=$APPPATH/data@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying ExecStart in SYSTEMD file failed.'$ENDCOLOR; exit 1; }

sudo systemctl daemon-reload
sudo systemctl enable $APPSYSTEMD
