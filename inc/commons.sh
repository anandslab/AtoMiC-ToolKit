YELLOW='\e[93m'
RED='\e[91m'
ENDCOLOR='\033[0m'
CYAN='\e[96m'
GREEN='\e[92m'
BACKTITLE="We put in a lot of effort into developing AtoMiC ToolKit. If this ToolKit helps you, please consider visiting www.htpcbeginner.com and sharing or following us to show your support."

function pause(){
   read -p "$*"
}

if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi

# IF NOT SETUP.SH THEN GET VALUES
#if [[ $0 != *"setup.sh"* ]]
#then 
#	#echo "Not setup.sh"
#	SCRIPTPATH=$2
#	UNAME=$3
#	UGROUP=$4
#fi
