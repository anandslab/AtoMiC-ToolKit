#!/bin/bash
echo
echo -e "$YELLOW--->Getting Latest version...$ENDCOLOR"
####################################
##   update_ombi systemd script   ##
## GitHub: Unimatrix0/update_ombi ##
##  Modified for AtoMiC-ToolKit   ##
####################################

##   The systemd unit for Ombi    ##
ombiservicename="ombi"

##    The update_ombi log file    ##
logfile="/var/log/ombiupdater.log"

####################################
##  The remaining variables only  ##
##  need to be set or overridden  ##
##  if the script is unable to    ##
##  parse the ombi.service file   ##
##  for the correct settings      ##
####################################
## !! This should never happen !! ##
####################################

##  The service file's full path  ##
ombiservicefile="/etc/systemd/system/$ombiservicename.service"

##     Ombi install directory     ##
defaultinstalldir="/opt/ombi"

##   User and Group Ombi runs as  ##
defaultuser="$UNAME"
defaultgroup="$UGROUP"
defaultip="127.0.0.1"
defaultport="5000"

##       Level of verbosity       ##
##        By default, none        ##

declare -i verbosity=-1

############################################
## Do not modify anything below this line ##
##   unless you know what you are doing   ##
############################################

name="update_ombi"
version="1.1.02"
SECONDS=0

while [ $# -gt 0 ]; do
  case "$1" in
    --verbosity|-v=*)
      if [[ ${1#*=} =~ ^-?[0-8]$ ]]; then
          verbosity="${1#*=}"
      else
          printf "****************************\n"
          printf "* Error: Invalid verbosity.*\n"
          printf "****************************\n"
          exit 1
      fi
      ;;
    *)
      printf "****************************\n"
      printf "* Error: Invalid argument. *\n"
      printf "****************************\n"
      exit 1
  esac
  shift
done

declare -A LOG_LEVELS=([-1]="none" [0]="emerg" [1]="alert" [2]="crit" [3]="err" [4]="warning" [5]="notice" [6]="info" [7]="debug" [8]="trace")
function .log () {
    local LEVEL=${1}
    shift
    if [[ $verbosity =~ ^-?[0-8]$ ]]; then
            if [ $verbosity -ge $LEVEL ]; then
            echo "[$(date '+%H:%M:%S')] [${LOG_LEVELS[$LEVEL]}]" "$@"
        fi
    fi
    if [ $verbosity -eq 8 ] || [ $LEVEL -ne 8 ]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S %Z' -u)] [${LOG_LEVELS[$LEVEL]}]" "$@" >> $logfile
    fi
}

unzip-strip() (
    local zip=$1
    local dest=${2:-.}
    local temp=$(mktemp -d) && tar -zxf "$zip" -C "$temp" && mkdir -p "$dest" &&
    shopt -s dotglob && local f=("$temp"/*) &&
    if (( ${#f[@]} == 1 )) && [[ -d "${f[0]}" ]] ; then
        cp -r "$temp"/*/* "$dest"
    else
        cp -r "$temp"/* "$dest"
    fi && rm -rf "$temp"/* "$temp"
)

.log 6 "$name v$version"
.log 6 "Verbosity level: [${LOG_LEVELS[$verbosity]}]"
scriptuser=$(whoami)

if [ -z "${installdir}" ]; then
    .log 5 "InstallDir not parsed...setting to default: $defaultinstalldir"
    installdir="$defaultinstalldir"
fi
if [ -z "${user}" ]; then
    .log 5 "User not parsed...setting to default: $defaultuser"
    user="$defaultuser"
fi
if [ -z "${group}" ]; then
    .log 5 "Group not parsed...setting to default: $defaultgroup"
    group="$defaultgroup"
fi
if [ -z "${ip}" ]; then
    .log 5 "IP not parsed or set as \"*\"...setting to default: $defaultip"
    ip="$defaultip"
fi
if [ -z "${port}" ]; then
    .log 5 "Port not parsed...setting to default: $defaultport"
    port="$defaultport"
fi

.log 6 "Downloading Ombi update..."
declare -i i=1
declare -i j=5
while [ $i -le $j ]
do
    .log 6 "Checking for latest version"
    json=$(curl -sL https://ombiservice.azurewebsites.net/api/update/DotNetCore)
    .log 8 "json: $json"
    latestversion=$(grep -Po '(?<="updateVersionString":")([^"]+)' <<<  "$json")
    .log 7 "latestversion: $latestversion"
    json=$(curl -sL https://ci.appveyor.com/api/projects/tidusjar/requestplex/build/$latestversion)
    .log 8 "json: $json"
    jobId=$(grep -Po '(?<="jobId":")([^"]+)' <<<  "$json")
    .log 7 "jobId: $jobId"
    version=$(grep -Po '(?<="version":")([^"]+)' <<<  "$json")
    .log 7 "version: $version"
    if [ $latestversion != $version ]; then
        .log 2 "Build version does not match expected version"
        exit 1
    fi
    .log 6 "Latest version: $version...determining expected file size..."
    size=$(curl -sL https://ci.appveyor.com/api/buildjobs/$jobId/artifacts | grep -Po '(?<="linux.tar.gz","type":"File","size":)(\d+)')
    .log 7 "size: $size"
    if [ -e $size ]; then
        if [ $i -lt $j ]; then
            .log 3 "Unable to determine update file size...[attempt $i of $j]"
        else
            .log 2 "Unable to determine update file size...[attempt $i of $j]...Bailing!"
            exit 2
        fi
        i+=1
        continue
    elif [[ $size =~ ^-?[0-9]+$ ]]; then
        .log 6 "Expected file size: $size...downloading..."
        break
    else
        .log 1 "Invalid file size value...bailing!"
        exit 99
    fi
done
tempdir=$(mktemp -d)
file="$tempdir/ombi_$version.tar.gz"
wget --quiet --show-progress -O $file "https://ci.appveyor.com/api/buildjobs/$jobId/artifacts/linux.tar.gz"
.log 6 "Version $version downloaded...checking file size..."
if [ $(wc -c < $file) != $size ]; then
    .log 3 "Downloaded file size does not match expected file size...bailing!"
    exit 2
fi

unzip-strip $file $installdir
.log 6 "Update installed...setting ownership..."
chown -R $user:$group $installdir

.log 6 "Cleaning up..."
rm -rf "$tempdir"/* "$tempdir"
declare -i elapsedtime=$SECONDS
declare -i minutes=0
declare -i seconds=0
if  [ $elapsedtime -ge 60 ]; then
    minutes=$(($elapsedtime / 60))
fi
seconds=$(($elapsedtime % 60))
if [ $minutes -ge 2 ]; then
    duration="$minutes minutes"
elif [ $minutes -eq 1 ]; then
    duration="$minutes minute"
fi
if [ $seconds -ge 2 ]; then
    duration+=" $seconds seconds"
elif [ $seconds -eq 1 ]; then
    duration+=" $seconds second"
fi
durationmsg="Update complete...elapsed time $duration..."
durationmsg="${durationmsg//  / }"
.log 6 "$durationmsg"
