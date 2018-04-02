#!/bin/bash
# Script Name: AtoMiC Aria2 Download

cd "$(mktemp -d)" || exit
APPPATH="$(pwd)" # Set the Path to temp so we can extract and build there.
source "$SCRIPTPATH/aria2/aria2-downloadext.sh"
source "$SCRIPTPATH/inc/app-git-download-release.sh"
source "$SCRIPTPATH/inc/app-git-latest-release-version.sh"

echo -e "$YELLOW--->Remove previous version...$ENDCOLOR"
sudo apt-get remove aria2 -y
echo
echo 'Starting Build'
sudo checkinstall -y --pkgversion="1:${AVAILABLEVERSION}" --pkgname='aria2' --pakdir='/var/cache/apt/archives'
# Reinstall ca-certificates as Aria2 breaks the permissions.
sudo apt-get install --reinstall ca-certificates
echo
rm -r "$(pwd)"
cd "$SCRIPTPATH" || exit

source "$SCRIPTPATH/inc/app-constant-reset.sh"
source "$SCRIPTPATH/aria2/aria2-constants.sh"
