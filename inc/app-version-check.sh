#!/bin/bash


checkappversion () {
    if [[ ! -f $SCRIPTPATH/tmp/ServiceVersions.cfg ]]; then
        source "$SCRIPTPATH/inc/commons.sh"
        touch $SCRIPTPATH/tmp/ServiceVersions.cfg
        echo "No previous version number found"
        if echo "${1}version=${2}" >> $SCRIPTPATH/tmp/ServiceVersions.cfg ; then
            echo "added ${1}version: ${2}"
        fi
        sudo chown $UNAME:$UGROUP $SCRIPTPATH/tmp/ServiceVersions.cfg
    else
        source "$SCRIPTPATH/tmp/ServiceVersions.cfg"
        combined=${1}version
        if [[ -z ${!combined} ]]; then
            echo "Current version not known so recording and will download latest"
            echo "${1}version=${2}" >> $SCRIPTPATH/tmp/ServiceVersions.cfg
        elif [[ ${!combined} = "${2}" ]]; then
            echo "Installed Version: ${2}"
            echo "Update not required"
            exit 1
        else
            sudo sed -i "s@${1}version=${!combined}@${1}version=${2}@g" $SCRIPTPATH/tmp/ServiceVersions.cfg || \
            { echo -e $RED'Modifying ServiceVersions file failed.'$ENDCOLOR; exit 1; }
        fi
    fi
}

removeappversion () {
    combined=${1}version
    if sed -i "/$combined/d" $SCRIPTPATH/tmp/ServiceVersions.cfg; then
        echo "${1} removed from $SCRIPTPATH/tmp/ServiceVersions.cfg"
    fi
}

vercomp () {
    if [[ ${1} == "${2}" ]]; then
        return 0
    fi
    local IFS=.
    local i ver1=("${1}") ver2=("${2}")
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++)); do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++)); do
        if [[ -z ${ver2[i]} ]]; then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]})); then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]})); then
            return 2
        fi
    done
    return 0
}
