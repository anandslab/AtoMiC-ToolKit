echo -e $GREEN'--->Type the username of the user you want to use for managing apps and press [ENTER]...'$ENDCOLOR
echo -e 'Typically, this is your system login name (IMPORTANT! Ensure correct spelling and case). Do not use "root". Current username is '$CYAN$SUDO_USER$ENDCOLOR': '
read UNAME
if [ ! -d "/home/$UNAME" ] || [ -z "$UNAME" ]; then
	echo
	echo -e $RED'Invalid username. No changes were made. Please rerun script and provide correct username.'$ENDCOLOR
	echo
	exit 0
else
	export UNAME=$UNAME
	export UGROUP=($(id -gn $UNAME))
	rm $SCRIPTPATH/tmp/userinfo >/dev/null 2>&1
	echo 'UNAME='$UNAME >> $SCRIPTPATH/tmp/userinfo
	echo 'UGROUP='$UGROUP >> $SCRIPTPATH/tmp/userinfo
fi

echo
sleep 1
