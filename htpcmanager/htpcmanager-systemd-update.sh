#!/bin/bash
# Script Name: AtoMiC HTPC Manager systemd update
#

sudo sed -i "s@ExecStart=-/usr/bin/python /path/to/HTPCManager/Htpc.py --daemon --datadir </path/to/HTPCManager>/userdata --pid </path/to/HTPCManager>/userdata/htpcmanager.pid@ExecStart=/usr/bin/python $APPPATH/Htpc.py --daemon --datadir $APPPATH/userdata @g" /etc/systemd/system/$APPSYSTEMD || { echo -e $RED'Modifying ExecStart in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@User=<user>@User=$UNAME@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying USER in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@Group=<user>@Group=$UGROUP@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying GROUP in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@PIDFile=</path/to/HTPCManager>/userdata/htpcmanager.pid@GuessMainPID=no@g" /etc/systemd/system/$APPSYSTEMD || { echo -e $RED'Replacing PIDFile failed.'$ENDCOLOR ; exit 1; }
sudo sed -i '/Type=forking/a \ \ RuntimeDirectoryMode=775' /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Adding RUNTIMEDIRECTORYMODE in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i '/Type=forking/a \ \ RuntimeDirectory=htpcmanager' /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Adding RUNTIMEDIRECTORY in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i '/^\ \ GuessMainPID=no/a \ \ Restart=on-failure' /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Adding RESTART in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i '/^\ \ GuessMainPID=no/a \ \ KillMode=process' /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Adding RESTART in SYSTEMD file failed.'$ENDCOLOR; exit 1; }

sudo systemctl daemon-reload
sudo systemctl enable $APPSYSTEMD
