#!/bin/bash
# Script Name: AtoMiC SickGear Systemd Update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
sudo sed -i '/Restart=on-failure/a GuessMainPID=no' /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Adding GUESSMAINPID in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i '/Restart=on-failure/a Type=forking' /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Adding TYPE in SYSTEMD file failed.'$ENDCOLOR; exit 1; }

sudo sed -i "s@Description=SickGear Service@Description=SickGear@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying DESCRIPTION in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@User=sickgear@User=$UNAME@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying USER in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@Group=sickgear@Group=$UGROUP@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying GROUP in SYSTEMD file failed.'$ENDCOLOR; exit 1; }

sudo sed -i "s@ExecStart=/usr/bin/python2 /opt/sickgear/app/SickBeard.py --systemd --datadir=/opt/sickgear/data@ExecStart=/usr/bin/python $APPPATH/SickBeard.py -q --daemon --nolaunch --datadir=$APPPATH/data@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying ExecStart in SYSTEMD file failed.'$ENDCOLOR; exit 1; }

sudo systemctl daemon-reload
sudo systemctl enable $APPSYSTEMD
