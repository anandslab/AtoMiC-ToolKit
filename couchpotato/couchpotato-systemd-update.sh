#!/bin/bash
# Script Name: AtoMiC CouchPotato SystemD
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)


sudo sed -i "s@ExecStart=/var/lib/CouchPotatoServer/CouchPotato.py@ExecStart=/usr/bin/python $APPPATH/CouchPotato.py --daemon --quiet --data_dir=$APPPATH/data@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying ExecStart in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@Type=simple@Type=forking@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying TYPE in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@User=couchpotato@User=$UNAME@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying USER in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@Group=couchpotato@Group=$UGROUP@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying GROUP in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i '/Type=forking/a GuessMainPID=no' /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Adding GUESSMAINPID in SYSTEMD file failed.'$ENDCOLOR; exit 1; }

sudo systemctl daemon-reload
sudo systemctl enable $APPSYSTEMD
