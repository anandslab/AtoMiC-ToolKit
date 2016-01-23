YELLOW='\e[93m'
RED='\e[91m'
ENDCOLOR='\033[0m'
CYAN='\e[96m'
GREEN='\e[92m'

function pause(){
   read -p "$*"
}

# IF NOT SETUP.SH THEN GET VALUES
if [[ $0 != *"setup.sh"* ]]
then 
	#echo "Not setup.sh"
	SCRIPTPATH=$2
	UNAME=$3
	UGROUP=$4
fi
