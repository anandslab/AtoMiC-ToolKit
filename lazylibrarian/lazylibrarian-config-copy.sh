#!/bin/bash
# Script Name: AtoMiC Lazy Librarian config copy
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.
sudo cp $SCRIPTPATH/lazylibrarian/config.ini $APPPATH || { echo $RED'Copy config file failed.'$ENDCOLOR ; exit 1; }