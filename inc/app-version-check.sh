#!/bin/bash
# shellcheck disable=SC1090
if [[ ! -f $SCRIPTPATH/tmp/ServiceVersions.cfg ]]; then
    source "$SCRIPTPATH/inc/commons.sh"
    touch $SCRIPTPATH/tmp/ServiceVersions.cfg
    echo "No previous version number found"
    if echo "${1}version=$2" >> $SCRIPTPATH/tmp/ServiceVersions.cfg ; then
        echo "added ${1}version: $2"
    fi
    sudo chown $UNAME:$UGROUP $SCRIPTPATH/tmp/ServiceVersions.cfg
else
    source "$SCRIPTPATH/tmp/ServiceVersions.cfg"
    combined=$1version
    if [[ -z ${!combined} ]]; then
        echo "Current version not known so recording and will download latest"
        echo "${1}version=$2" >> $SCRIPTPATH/tmp/ServiceVersions.cfg
    elif [[ ${!combined} = "$2" ]]; then
        echo "Installed Version: $2"
        echo "Update not required"
        exit 1
    else
        sudo sed -i "s@${1}version=${!combined}@${1}version=$2@g" $SCRIPTPATH/tmp/ServiceVersions.cfg \
        || { echo -e $RED'Modifying ServiceVersions file failed.'$ENDCOLOR; exit 1; }
    fi
fi
