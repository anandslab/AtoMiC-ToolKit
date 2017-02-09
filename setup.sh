#!/bin/bash
# Script Name: AtoMiC ToolKit
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

# Set caller id and script path
export CALLER=$(ps ax | grep "^ *$PPID" | awk '{print $NF}')
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
export SCRIPTPATH="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

export ISSETUP="Yes"

source $SCRIPTPATH/inc/commons.sh

# Check if being run as root
if [ "$EUID" -ne 0 ]
  then 
  echo
  echo -e $RED'Please run as root using the command: '$ENDCOLOR'sudo bash setup.sh'
  echo
  exit 0
fi

source $SCRIPTPATH/inc/header.sh

#echo -e $RED'This setup file is in development and can mess up your system. Exit and run '$CYAN'sudo ./setup.sh'$RED' instead.'$ENDCOLOR
#source $SCRIPTPATH/inc/pause.sh

#sleep 1
echo $1

if [ ! -d "$SCRIPTPATH/tmp" ]; then
	mkdir $SCRIPTPATH/tmp
fi

if [ ! -d "$SCRIPTPATH/backups" ]; then
	mkdir $SCRIPTPATH/backups
fi

echo -e $YELLOW'--->DISCLAIMERS:'$ENDCOLOR
if [ ! -f "$SCRIPTPATH/tmp/consented" ]; then
	#echo 'consent file not present'
	source $SCRIPTPATH/inc/consent.sh
else
	echo -e 'Already agreed. Can be cleared in the next screen.'
fi

echo
#sleep 1

echo -e $YELLOW'--->USER INFORMATION:'$ENDCOLOR
if [ ! -f "$SCRIPTPATH/tmp/userinfo" ]; then
	#echo 'userinfo not present'
	source $SCRIPTPATH/inc/usercheck.sh
else 
	#echo 'userinfo present'
	source $SCRIPTPATH/tmp/userinfo
	if [ -z "$UNAME" ] || [ -z "$UGROUP" ]; then
		#echo 'userinfo not complete'
		source $SCRIPTPATH/inc/usercheck.sh
	else
		echo -e 'Already present: '$CYAN$UNAME$ENDCOLOR. 'Can be cleared in the next screen.'
		source $SCRIPTPATH/inc/pause.sh
	fi
fi

# Set permissions for all files
sudo chown -R $UNAME:$UGROUP $SCRIPTPATH >/dev/null 2>&1
sudo chmod -R 775 $SCRIPTPATH >/dev/null 2>&1
sudo chmod -R g+s $SCRIPTPATH >/dev/null 2>&1
    
source $SCRIPTPATH/inc/header.sh
source $SCRIPTPATH/menus/menu-main.sh
