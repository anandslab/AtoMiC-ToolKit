#!/bin/bash

# Set permissions for all files
sudo chown -R $UNAME:$UGROUP $SCRIPTPATH >/dev/null 2>&1
sudo chmod -R 775 $SCRIPTPATH >/dev/null 2>&1
sudo chmod -R g+s $SCRIPTPATH >/dev/null 2>&1

if [[ ! -d '/opt' ]]; then
	mkdir /opt
	sudo chown -R $UNAME:$UGROUP /opt >/dev/null 2>&1
	sudo chmod -R 775 /opt >/dev/null 2>&1
	sudo chmod -R g+s /opt >/dev/null 2>&1
	echo -e 'opt dir created.'
fi

#Check for bad arguments and move on
if [ $? -ne 0 ];
then
    help;
fi

eval set -- "$ARGS";

#Options
while true; do
    case "$1" in
        -h|--help)
            shift;
                    if [ -n "$1" ]; 
                    then
                        help
                    fi
            ;;
        -i|--install)
            shift;
                    if [ -n "$1" ]; 
                    then
                        install="$1";
						source $SCRIPTPATH/$1/$1-constants.sh
						source $SCRIPTPATH/$1/$1-installer.sh
                        shift;
                    fi
            ;;
        -u|--uninstall)
            shift;
                    if [ -n "$1" ]; 
                    then
                        uninstall="$1";
						source $SCRIPTPATH/$1/$1-constants.sh
						source $SCRIPTPATH/$1/$1-uninstaller.sh
                        shift;
                    fi
            ;;
        -b|--backup)
            shift;
                    if [ -n "$1" ]; 
                    then
                        backup="$1";
						source $SCRIPTPATH/$1/$1-constants.sh
						source $SCRIPTPATH/inc/app-backup-controller.sh
                        shift;
                    fi
            ;;
        -r|--restore)
            shift;
                    if [ -n "$1" ]; 
                    then
                        restore="$1";
						source $SCRIPTPATH/$1/$1-constants.sh
						source $SCRIPTPATH/inc/app-restore-controller.sh
                        shift;
                    fi
            ;;
        -m|--manualupdate)
            shift;
                    if [ -n "$1" ]; 
                    then
                        manualupdate="$1";
						source $SCRIPTPATH/$1/$1-constants.sh
						source $SCRIPTPATH/$1/$1-updater.sh
                        shift;
                    fi
            ;;
        -p|--passwordreset)
            shift;
                    if [ -n "$1" ]; 
                    then
                        passwordreset="$1";
						source $SCRIPTPATH/$1/$1-constants.sh
						source $SCRIPTPATH/inc/app-password-reset.sh
                        shift;
                    fi
            ;;
        -a|--accessdetails)
            shift;
                    if [ -n "$1" ]; 
                    then
                        accessdetails="$1";
						source $SCRIPTPATH/$1/$1-constants.sh
						source $SCRIPTPATH/inc/app-access-details.sh
                        shift;
                    fi
            ;;
        -t|--updatetoolkit)
            shift;
                    updatetoolkit="1";
					source $SCRIPTPATH/maintenance/update.sh
            ;;
        -U|--updateall)
            shift;
                    updateall="1";
					source $SCRIPTPATH/maintenance/distro-update.sh
            ;;

        --)
            shift;
            break;
            ;;
    esac
done

# Check required arguments

