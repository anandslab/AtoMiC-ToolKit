echo
sleep 1
echo -e $YELLOW'--->Downloading latest '$APPTITLE'...'$ENDCOLOR
git clone $APPGIT $APPPATH || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }
source $SCRIPTPATH/inc/app-set-permissions.sh