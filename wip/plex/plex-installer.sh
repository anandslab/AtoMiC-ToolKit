#!/bin/bash
# Script Name: AtoMiC Plex Installer
# Author: carrigan98, OoGuru
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
source $SCRIPTPATH/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN'AtoMiC Plex Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh

echo
sleep 1

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install git-core

echo
sleep 1

echo -e $YELLOW'--->Checking for previous versions of Plex...'$ENDCOLOR
sleep 1
sudo service plexmediaserver stop >/dev/null 2>&1
echo -e 'Any running Plex Media Server processes stopped'
sleep 1
sudo update-rc.d -f plexmediaserver remove >/dev/null 2>&1
sudo rm /etc/init.d/plexmediaserver >/dev/null 2>&1
sudo rm /etc/default/plexmediaserver >/dev/null 2>&1
echo -e 'Any existing Plex init scripts removed'
sleep 1
sudo update-rc.d -f plexmediaserver remove >/dev/null 2>&1
if [ -d "/home/$UNAME/.plexupdate" ]; then
	PlexUpdateBackup=".plexupdate_`date '+%m-%d-%Y_%H-%M'`"
	sudo mv /home/$UNAME/.plexupdate /home/$UNAME/$PlexUpdateBackup >/dev/null 2>&1
	echo -e "Existing Plex Config files were moved to $CYAN/home/$UNAME/$PlexUpdateBackup"$ENDCOLOR
else
	echo -e 'No previous .plexupdate folder found'
fi
if [ -d "/home/$UNAME/plexupdate" ]; then
	PlexUpdateBackup="plexupdate_`date '+%m-%d-%Y_%H-%M'`"
	sudo mv /home/$UNAME/plexupdate /home/$UNAME/$PlexUpdateBackup >/dev/null 2>&1
	echo -e "Existing Plex Config files were moved to $CYAN/home/$UNAME/$PlexUpdateBackup"$ENDCOLOR
else
	echo -e 'No previous plexupdate folder found'
fi
for f in `find /etc/cron.*/*plexupdate* -type f`
	do
		filename=`echo $f|awk -F'/' '{SL = NF-1; print $SL  "_" $NF}'`
		mkdir -p /home/$UNAME/$PlexUpdateBackup/cronjob/
		mv $f /home/$UNAME/$PlexUpdateBackup/cronjob/$filename
	done >/dev/null 2>&1
	echo -e "Existing PlexUpdate cronjob files were moved to $CYAN/home/$UNAME/$PlexUpdateBackup/cronjobs/"$ENDCOLOR

echo
echo -e $YELLOW'--->Downloading plexupdate...'$ENDCOLOR
cd /home/$UNAME
git clone https://github.com/mrworf/plexupdate.git /home/$UNAME/plexupdate || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }

echo
sleep 1

# Input Plex Pass account email
function PlexPassEmail(){
# Thank mklement0 for the input script! (modified)
email1=''
CHARCOUNT=0
echo -ne "\e[1;37mPlease enter your email for your Plex Pass enabled account: \e[93m"
while IFS= read -r -s -n1 char; do
  [[ -z $char ]] && { printf '\n'; break; }
  if [[ $char == $'\x7f' ]]; then
	if [ $CHARCOUNT -gt 0 ] ; then
	  CHARCOUNT=$((CHARCOUNT-1))
      [[ -n $email1 ]] && email1=${email1%?}
      printf '\b \b' 
	  else
	  printf ''
	  fi
  else
	CHARCOUNT=$((CHARCOUNT+1))
    email1+=$char
    printf '*'
  fi
done
echo -ne "\033[0m" # Reset text color
# mklement0's script end
# Thank mklement0 for the input script! (modified)
email2=''
CHARCOUNT=0
echo -ne "\e[1;37mPlease reenter your email for your Plex Pass enabled account: \e[93m"
while IFS= read -r -s -n1 char; do
  [[ -z $char ]] && { printf '\n'; break; }
  if [[ $char == $'\x7f' ]]; then
	if [ $CHARCOUNT -gt 0 ] ; then
	  CHARCOUNT=$((CHARCOUNT-1))
      [[ -n $email2 ]] && email2=${email2%?}
      printf '\b \b' 
	  else
	  printf ''
	  fi
  else
	CHARCOUNT=$((CHARCOUNT+1))
    email2+=$char
    printf '*'
  fi
done
echo -ne "\033[0m" # Reset text color
# mklement0's script end
if [ "$email1" == "$email2" ]; then
	PPemail="$email1"
	echo "Email has been set"
else
	echo "The entered emails did not match - please try again"
	echo
	PlexPassEmail
fi
}

# Input Plex Pass account password
function PlexPassPassword(){
# Thank mklement0 for the input script! (modified)
password1=''
CHARCOUNT=0
echo -ne "\e[1;37mPlease enter your password for your Plex Pass enabled account: \e[93m"
while IFS= read -r -s -n1 char; do
  [[ -z $char ]] && { printf '\n'; break; }
  if [[ $char == $'\x7f' ]]; then
	if [ $CHARCOUNT -gt 0 ] ; then
	  CHARCOUNT=$((CHARCOUNT-1))
      [[ -n $password1 ]] && password1=${password1%?}
      printf '\b \b' 
	  else
	  printf ''
	  fi
  else
	CHARCOUNT=$((CHARCOUNT+1))
    password1+=$char
    printf '*'
  fi
done
echo -ne "\033[0m" # Reset text color
# mklement0's script end
# Thank mklement0 for the input script! (modified)
password2=''
CHARCOUNT=0
echo -ne "\e[1;37mPlease reenter your password for your Plex Pass enabled account: \e[93m"
while IFS= read -r -s -n1 char; do
  [[ -z $char ]] && { printf '\n'; break; }
  if [[ $char == $'\x7f' ]]; then
	if [ $CHARCOUNT -gt 0 ] ; then
	  CHARCOUNT=$((CHARCOUNT-1))
      [[ -n $password2 ]] && password2=${password2%?}
      printf '\b \b' 
	  else
	  printf ''
	  fi
  else
	CHARCOUNT=$((CHARCOUNT+1))
    password2+=$char
    printf '*'
  fi
done
echo -ne "\033[0m" # Reset text color
# mklement0's script end
if [ "$password1" == "$password2" ]; then
	PPpassword="$password1"
	echo "Password has been set"
else
	echo "The entered passwords did not match - please try again"
	echo
	PlexPassPassword
fi
}

# Setup Plex Update for Plex Pass
function installPlexPassMediaServer(){
	PlexPassEmail
	PlexPassPassword
	read -p $'\e[1;37mIs this information correct? (Y/N) \e[93m' PPanswer
	echo -ne "\033[0m" # Reset text color
	case "$PPanswer" in
		Y|y)
			echo -e $YELLOW'--->Creating config file...'$ENDCOLOR
			sudo mkdir -p /tmp/plex
			echo '# COPY THIS FILE TO ~/.plexupdate'  > /home/$UNAME/.plexupdate || { echo 'Could not create config file.' ; exit 1; }
			echo "EMAIL='$PPemail'"                  >> /home/$UNAME/.plexupdate
			echo "PASS='$PPpassword'"                >> /home/$UNAME/.plexupdate
			echo 'DOWNLOADDIR="/tmp/plex"'           >> /home/$UNAME/.plexupdate
			echo 'KEEP=no'                           >> /home/$UNAME/.plexupdate
			echo 'FORCE=no'                          >> /home/$UNAME/.plexupdate
			echo 'PUBLIC=no'                         >> /home/$UNAME/.plexupdate
			echo 'AUTOINSTALL=yes'                   >> /home/$UNAME/.plexupdate
			echo 'AUTODELETE=yes'                    >> /home/$UNAME/.plexupdate
			echo 'AUTOUPDATE=yes'                    >> /home/$UNAME/.plexupdate
			echo 'AUTOSTART=yes'                     >> /home/$UNAME/.plexupdate
			;;
		N|n)
			echo "$PPanswer" | grep -iq "[Nn]" ;then
			echo
			echo "User replied with N/n - please try again"
			echo 
			installPlexPassMediaServer
			;;
		*)
			echo
			echo "User did not reply with Y/y - please try again"
			echo 
			installPlexPassMediaServer
			;;
	esac
}
# Decide whether to use Plex Pass server or Public
function SetPlexMediaServerBranch(){
	echo -e $YELLOW"--->Set Plex Server Media Server Branch..."$ENDCOLOR
	echo -e "\e[1;37mWhich server branch do you whish to install?"$ENDCOLOR
	echo -e $YELLOW"1. "$ENDCOLOR"Plex Pass Media Server (requires a Plex Pass enabled account)"
	echo -e $YELLOW"2. "$ENDCOLOR"Public Plex Media Server (available for everyone - no need for an account)"
	read -p $'\e[1;37mEnter 1 or 2: \e[93m' PMSchoice
	case "$PMSchoice" in
		1|01|1.)
			installPlexPassMediaServer
			;;
		2|02|2.)
			echo -e $YELLOW'--->Creating config file...'$ENDCOLOR
			sudo mkdir -p /tmp/plex
			echo '# COPY THIS FILE TO ~/.plexupdate'  > /home/$UNAME/.plexupdate || { echo 'Could not create config file.' ; exit 1; }
			echo 'EMAIL='                            >> /home/$UNAME/.plexupdate
			echo 'PASS='                             >> /home/$UNAME/.plexupdate
			echo 'DOWNLOADDIR="/tmp/plex"'           >> /home/$UNAME/.plexupdate
			echo 'KEEP=no'                           >> /home/$UNAME/.plexupdate
			echo 'FORCE=no'                          >> /home/$UNAME/.plexupdate
			echo 'PUBLIC=yes'                        >> /home/$UNAME/.plexupdate
			echo 'AUTOINSTALL=yes'                   >> /home/$UNAME/.plexupdate
			echo 'AUTODELETE=yes'                    >> /home/$UNAME/.plexupdate
			echo 'AUTOUPDATE=yes'                    >> /home/$UNAME/.plexupdate
			echo 'AUTOSTART=yes'                     >> /home/$UNAME/.plexupdate
			;;
		*)
			echo 
			echo -e "\033[0mAnswer was not 1 or 2 - please try again."
			SetPlexMediaServerBranch
			;;
		esac
}
SetPlexMediaServerBranch
echo -ne "\033[0m" # Reset text color

# Run plexupdate via cronjob (if user wants to)
function runPlexUpdateCron(){
	echo -e $YELLOW"--->Choose manual or automatic Plex updates..."$ENDCOLOR
	echo
	echo -e $YELLOW"Do you wish for PlexUpdate to do automatic updates?"$ENDCOLOR
	echo
	echo -e $YELLOW" 1. "$ENDCOLOR"Yes, please. Check for updates everyday"
	echo -e $YELLOW" 2. "$ENDCOLOR"Yes, please. Check for updates week"
	echo -e $YELLOW" 3. "$ENDCOLOR"Yes, please. Check for updates month"
	echo -e $YELLOW" 4. "$ENDCOLOR"No, thank you. I want to run it manually"
	echo
	read -p $'\e[93mWhat would you like:\033[0m ' CronChoice
	case "$CronChoice" in
		1|01|1.)
			echo "bash /home/$UNAME/plexupdate/plexupdate.sh" >> /etc/cron.daily/plexupdate
			chmod +x /etc/cron.daily/plexupdate
			echo
			echo -e $CYAN"PlexUpdate has been setup to run daily"$ENDCOLOR
			echo -e $CYAN"You can find the specific run time in /etc/crontab"$ENDCOLOR
			;;
		2|02|2.)
			echo "bash /home/$UNAME/plexupdate/plexupdate.sh" >> /etc/cron.weekly/plexupdate
			chmod +x /etc/cron.weekly/plexupdate
			echo
			echo -e $CYAN"PlexUpdate has been setup to run weekly"$ENDCOLOR
			echo -e $CYAN"You can find the specific run time in /etc/crontab"$ENDCOLOR
			;;
		3|03|3.)
			echo "bash /home/$UNAME/plexupdate/plexupdate.sh" >> /etc/cron.monthly/plexupdate
			chmod +x /etc/cron.monthly/plexupdate
			echo
			echo -e $CYAN"PlexUpdate has been setup to run monthly"$ENDCOLOR
			echo -e $CYAN"You can find the specific run time in /etc/crontab"$ENDCOLOR
			;;
		4|04|4.)
			echo -e "Run \""$CYAN"sudo bash /home/$UNAME/plexupdate/plexupdate.sh"$ENDCOLOR"\" to manually update"
			;;
		*)
			echo 
			echo "User did not enter a valid option - please try again"
			runPlexUpdateCron
			;;
	esac
}
runPlexUpdateCron
echo -ne "\033[0m" # Reset text color

# Reset variables
email1=""; email2=""; PPemail=""; password1=""; password2=""; PPemail=""; PPpassword=""; PPanswer=""; PMSchoice=""; CronChoice="";

echo 
sleep 3

# Run plexupdate
echo -e $YELLOW'--->Running plexupdate script...'$ENDCOLOR
sudo bash /home/$UNAME/plexupdate/plexupdate.sh

echo 
sleep 1

clear
echo -e $GREEN'--->All done. '$ENDCOLOR
echo -e 'Plex should start within 10-20 seconds and your browser should open.'
echo -e 'If not you can start it using '$CYAN'/etc/init.d/plexmediaserver start'$ENDCOLOR' command.'
echo -e 'Then open '$CYAN'http://localhost:32400/manage'$ENDCOLOR' in your browser.'

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
