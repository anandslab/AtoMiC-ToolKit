echo -e $YELLOW'--->Type the username of the user you want to use for managing apps and press [ENTER]...'$ENDCOLOR
echo -n 'Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case): '
read UNAME
export UNAME=$UNAME
if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
	echo
	echo -e $RED'Invalid username. No changes were made. Please rerun script and provide correct username.'$ENDCOLOR
	echo
	exit 0
fi
export UGROUP=($(id -gn $UNAME))

echo
sleep 1
