#!/bin/bash
# Script Name: AtoMiC Lazy Librarian init.d update
# Author: TommyE123
# Publisher: http://www.htpcbeginner.com
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
echo 'Updating init.d file'
sudo sed -i 's@/home/$RUN_AS/.lazylibrarian/config.ini@/opt/lazylibrarian/lazylibrarian.ini@g' /etc/init.d/$APPNAME || { echo -e $RED'Replacing CONFIG failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's@/home/$RUN_AS/.lazylibrarian@/opt/lazylibrarian@g' /etc/init.d/$APPNAME || { echo -e $RED'Replacing DATADIR failed.'$ENDCOLOR ; exit 1; }
sudo sed -i 's@PID_FILE=/var/run/lazylibrarian/lazylibrarian.pid@PID_FILE=/opt/lazylibrarian/lazylibrarian.pid@g' /etc/init.d/$APPNAME || { echo -e $RED'Replacing PID_FILE failed.'$ENDCOLOR ; exit 1; }
