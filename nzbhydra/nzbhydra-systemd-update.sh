#!/bin/bash
# Script Name: AtoMiC NZBHydra systemd update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

sudo sed -i "s@ExecStart=python /path-to/nzbhydra/nzbhydra.py --daemon --nobrowser --pidfile /path-to/nzbhydra/nzbhydra.pid@ExecStart=/usr/bin/python $APPPATH/nzbhydra.py --daemon --nobrowser --pidfile $APPPIDFILE --config $APPSETTINGS --database $APPPATH/nzbhydra.db@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying ExecStart in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@User=ChangeMe@User=$UNAME@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying USER in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@Group=ChangeMe@Group=$UGROUP@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying GROUP in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@^PIDFile=/path-to/nzbhydra/nzbhydra.pid@PIDFile=$APPPIDFILE@g" /etc/systemd/system/$APPSYSTEMD || { echo -e $RED'Replacing PIDFile failed.'$ENDCOLOR ; exit 1; }
sudo sed -i '/Type=forking/a RuntimeDirectoryMode=775' /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Adding RUNTIMEDIRECTORYMODE in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i '/Type=forking/a RuntimeDirectory=nzbhydra' /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Adding RUNTIMEDIRECTORY in SYSTEMD file failed.'$ENDCOLOR; exit 1; }

sudo systemctl daemon-reload
sudo systemctl enable $APPSYSTEMD
