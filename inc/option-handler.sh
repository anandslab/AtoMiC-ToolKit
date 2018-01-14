#!/bin/bash
# shellcheck disable=SC1090
#Response for bad arguments or unsupported features
BADARG='The app you specified does not exist. Check the name again (note: it is case sensitive)'
NOARGSUPPORT='This app doesn''t support the '$1' option. Check the readme file for which operations are supported for each app.'

#Check for bad option and move on
if [[ $? -ne 0 ]]; then
    help;
fi

eval set -- "$ARGS";

#Nothing passed in so just blank the ARGS variable
if [[ $1 = '--' ]]; then
    ARGS=''
fi

#Options
while true; do
    case "$1" in
        -h|--help)
            shift;
            if [[ -n $1 ]]; then
                help
            fi
            ;;
        -i|--install)
            shift;
            if [[ -n $1 ]]; then
                install="$1";
                if [[ -f $SCRIPTPATH/$1/$1-installer.sh ]]; then
                    source "$SCRIPTPATH/$1/$1-constants.sh"
                    source "$SCRIPTPATH/$1/$1-installer.sh"
                elif [[ -f $SCRIPTPATH/utils/$1/$1-installer.sh ]]; then
                    if [[ -f $SCRIPTPATH/utils/$1/$1-constants.sh ]]; then
                        source "$SCRIPTPATH/utils/$1/$1-constants.sh"
                    fi
                    source "$SCRIPTPATH/utils/$1/$1-installer.sh"
                else
                    echo
                    echo
                    echo "$BADARG"
                    source "$SCRIPTPATH/inc/exit.sh"
                fi
                shift;
            fi
            ;;
        -u|--uninstall)
            shift;
            if [[ -n $1 ]]; then
                uninstall="$1";
                if [[ ! -f $SCRIPTPATH/$1/$1-uninstaller.sh ]]; then
                    echo
                    echo
                    echo "$BADARG"
                    source "$SCRIPTPATH/inc/exit.sh"
                else
                    source "$SCRIPTPATH/$1/$1-constants.sh"
                    source "$SCRIPTPATH/$1/$1-uninstaller.sh"
                fi
                shift;
            fi
            ;;
        -b|--backup)
            shift;
            if [[ -n $1 ]]; then
                backup="$1";
                if [[ ! -f $SCRIPTPATH/$1/$1-constants.sh ]]; then
                    echo
                    echo
                    echo "$BADARG"
                    source "$SCRIPTPATH/inc/exit.sh"
                else
                    source "$SCRIPTPATH/$1/$1-constants.sh"
                    source "$SCRIPTPATH/inc/app-backup-controller.sh"
                fi
                shift;
            fi
            ;;
        -r|--restore)
            shift;
            if [[ -n $1 ]]; then
                restore="$1";
                if [[ ! -f $SCRIPTPATH/$1/$1-constants.sh ]]; then
                    echo
                    echo
                    echo "$BADARG"
                    source "$SCRIPTPATH/inc/exit.sh"
                else
                    source "$SCRIPTPATH/$1/$1-constants.sh"
                    source "$SCRIPTPATH/inc/app-restore-controller.sh"
                fi
                shift;
            fi
            ;;
        -m|--manualupdate)
            shift;
            if [[ -n $1 ]]; then
                manualupdate="$1";
                if [ ! -f "$SCRIPTPATH/$1/$1-update.sh" ]; then
                    echo
                    echo
                    echo "$BADARG"
                    source "$SCRIPTPATH/inc/exit.sh"
                else
                    source "$SCRIPTPATH/$1/$1-constants.sh"
                    source "$SCRIPTPATH/$1/$1-update.sh"
                fi
                shift;
            fi
            ;;
        -p|--passwordreset)
            shift;
            if [[ -n $1 ]]; then
                passwordreset="$1";
                if [[ ! -f $SCRIPTPATH/$1/$1-constants.sh ]]; then
                    echo
                    echo
                    echo "$BADARG"
                    source "$SCRIPTPATH/inc/exit.sh"
                else
                    if grep -q "Reset Password" "$SCRIPTPATH/$1/$1-menu.sh"; then
                        source "$SCRIPTPATH/$1/$1-constants.sh"
                        source "$SCRIPTPATH/inc/app-password-reset.sh"
                    else
                        echo
                        echo
                        echo "$NOARGSUPPORT"
                        source "$SCRIPTPATH/inc/exit.sh"
                    fi
                fi
                shift;
            fi
            ;;
        -a|--accessdetails)
            shift;
            if [[ -n $1 ]]; then
                accessdetails="$1";
                if [[ ! -f $SCRIPTPATH/$1/$1-constants.sh ]]; then
                    echo
                    echo
                    echo "$BADARG"
                    source "$SCRIPTPATH/inc/exit.sh"
                else
                    source "$SCRIPTPATH/$1/$1-constants.sh"
                    source "$SCRIPTPATH/inc/app-access-details.sh"
                fi
                shift;
            fi
            ;;
        -t|--updatetoolkit)
            shift;
            updatetoolkit="1";
            source "$SCRIPTPATH/maintenance/update.sh"
            ;;
        -U|--updateall)
            shift;
            updateall="1";
            source "$SCRIPTPATH/maintenance/distro-update.sh"
            ;;

        --)
            shift;
            break;
            ;;
    esac
done
