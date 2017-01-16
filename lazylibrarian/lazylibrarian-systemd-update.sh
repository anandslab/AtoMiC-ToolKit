#!/bin/bash
# Script Name: AtoMiC Lazy Librarian systemd update
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

sudo sed -i "s@ExecStart=/usr/bin/python /home/lazylibrarian/LazyLibrarian.py --daemon --config /home/lazylibrarian/lazylibrarian.ini --datadir /home/lazylibrarian/.lazylibrarian --nolaunch@ExecStart=/usr/bin/python $APPPATH/LazyLibrarian.py --daemon --config $APPPATH/lazylibrarian.ini --datadir $APPPATH/.lazylibrarian --nolaunch@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying ExecStart in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@User=lazylibrarian@User=$UNAME@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying USER in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo sed -i "s@Group=lazylibrarian@Group=$UGROUP@g" /etc/systemd/system/$APPSYSTEMD  || { echo -e $RED'Modifying GROUP in SYSTEMD file failed.'$ENDCOLOR; exit 1; }
sudo systemctl daemon-reload
sudo systemctl enable $APPSYSTEMD
