echo
cd $SCRIPTPATH
source $SCRIPTPATH/inc/pause.sh
if [ -z "$ARGS" ]
	then
		sudo bash $SCRIPTPATH/setup.sh
	else
		exit
	fi
fi
