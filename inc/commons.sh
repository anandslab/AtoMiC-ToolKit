#!/bin/bash
# shellcheck disable=SC2034
YELLOW='\e[93m'
RED='\e[91m'
ENDCOLOR='\033[0m'
CYAN='\e[96m'
GREEN='\e[92m'
BACKTITLE='We have worked several hundred hours on AtoMiC ToolKit. Please visit www.htpcbeginner.com and share or follow us to show your support.'
LINES=26
COLUMNS=78
NETLINES=16

function pause(){
   read -p "$*"
}
