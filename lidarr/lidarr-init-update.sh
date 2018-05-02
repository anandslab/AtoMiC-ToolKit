#!/bin/bash
# Script Name: AtoMiC Lidarr init.d update

echo 'Updating init.d file'

ReplaceString "RUNASUSER=root" "RUNASUSER=$UNAME" "/etc/init.d/$APPINITD"
ReplaceString "RUNASGROUP=root" "RUNASGROUP=$UGROUP" "/etc/init.d/$APPINITD"
