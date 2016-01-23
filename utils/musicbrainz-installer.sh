#!/bin/bash
# Script Name: AtoMiC Musicbrainz Installer
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $1 != *"setup.sh"* ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi

source $2/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN'AtoMiC Musicbrainz Installer Script'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh
source $SCRIPTPATH/inc/pkgupdate.sh

echo -n 'Type the directory you want to store the Musicbrainz Database as and press [ENTER]. (IMPORTANT! Database needs 80GB of storage): '
read DIRPATH

if [ ! -d $DIRPATH ]; then
	read -p 'Directory does not exist. Would you like to create this directory? Type y/Y and press [ENTER]'
    RESP=${REPLY,,}
    if [ "$RESP" != "y" ]; then
        echo -e $RED'So you chickened out. May be you will try again later.'$ENDCOLOR
		source $SCRIPTPATH/inc/exit.sh
    fi
    sudo mkdir -p $DIRPATH
fi

echo
sleep 1

echo -e $YELLOW'--->Installing prerequisites...'$ENDCOLOR
sudo apt-get -y install \
    postgresql-9.3 \
    postgresql-server-dev-all \
    postgresql-contrib-9.3 \
    postgresql-plperl-9.3 \
    git-core \
    memcached \
    redis-server \
    nodejs \
    npm \
    build-essential \
    libxml2-dev \
    libpq-dev \
    libexpat1-dev \
    libdb-dev \
    libicu-dev \
    liblocal-lib-perl \
    cpanminus \
    libicu-dev \
    libjson-xs-perl

echo
sleep 1

echo -e $YELLOW'--->Downloading latest Musicbrainz...'$ENDCOLOR
cd $DIRPATH
sudo git clone --recursive git://github.com/metabrainz/musicbrainz-server.git $DIRPATH/musicbrainz || { echo -e $RED'Git not found.'$ENDCOLOR ; exit 1; }
sudo chown -R $UNAME:$UGROUP $DIRPATH/musicbrainz >/dev/null 2>&1
sudo chmod 775 -R $DIRPATH/musicbrainz >/dev/null 2>&1

echo
sleep 1

# echo -e $YELLOW"--->Copying settings file and setting permissions..."$ENDCOLOR
# cp $SCRIPTPATH/DBDefs.pm $DIRPATH/musicbrainz/lib/DBDefs.pm
# sudo chown -R $UNAME:$UGROUP $DIRPATH/musicbrainz >/dev/null 2>&1
# sudo chmod 775 -R $DIRPATH/musicbrainz >/dev/null 2>&1

echo
sleep 1

echo -e $YELLOW'--->Installing Dependencies...'$ENDCOLOR
cd $DIRPATH/musicbrainz
echo 'eval $( perl -Mlocal::lib )' >> ~/.bashrc
source ~/.bashrc
cpanm --installdeps --force --notest .
npm install
./node_modules/.bin/gulp

pause 'Press [Enter] key to continue...'

echo
sleep 1

echo -e $YELLOW'--->Installing PostgreSQL Extensions...'$ENDCOLOR
sudo mkdir -p $DIRPATH/postgresql
sudo chown -R postgres:postgres $DIRPATH/postgresql
sudo su postgres
/usr/lib/postgresql/9.3/bin/initdb -D $DIRPATH/postgresql

pause 'Press [Enter] key to continue...'

#
# Change data_directory = '/usr/lib/postgresql/9.3/main to data_directory = '$DIRPATH/postgresql'
#
#NEWDIR = "'"$DIRPATH"/postgresql'"
#sed -i '/^ *data_directory = / s/ [^# ]/ /'$DIRPATH'/postgresql/' /etc/postgresql/9.3/main/postgresql.conf || { echo -e $RED'Replacing data directory in postgresql.conf failed.'$ENDCOLOR ; exit 1; }
#
# Change the ssl = true to ssl = false
#
#sed -i 'ssl = / s/ false'

cd $DIRPATH/musicbrainz/postgresql-musicbrainz-unaccent
sudo make
sudo make install
cd $DIRPATH/musicbrainz/postgresql-musicbrainz-collate
sudo make
sudo make install

source $SCRIPTPATH/inc/pause.sh

echo
sleep 1

echo -e $YELLOW'--->Downloading Database Export...'$ENDCOLOR
if [ ! -d $DIRPATH/musicbrainz/tmp ]; then
    sudo mkdir -p $DIRPATH/musicbrainz/tmp
    cd $DIRPATH/musicbrainz/tmp
    DBVER=$(curl ftp://ftp.musicbrainz.org/pub/musicbrainz/data/fullexport/LATEST)
    sudo wget ftp://ftp.musicbrainz.org/pub/musicbrainz/data/fullexport/$DBVER/mbdump*.tar.bz2
fi

source $SCRIPTPATH/inc/pause.sh

# echo -e $YELLOW'--->Configuring Musicbrainz Install...'$ENDCOLOR
# cd /home/$UNAME/.musicbrainz/init
# echo "# COPY THIS FILE TO /etc/default/Musicbrainz" >> musicbrainz || { echo 'Could not create default file.' ; exit 1; }
# echo "# OPTIONS: MB_HOME, MB_USER, MB_DATA, MB_PIDFILE, PYTHON_BIN, MB_OPTS, SSD_OPTS" >> musicbrainz
# echo "MB_HOME=/home/"$UNAME"/.musicbrainz/" >> musicbrainz
# echo "MB_DATA=/home/"$UNAME"/.musicbrainz/" >> musicbrainz
# echo -e 'Enabling user'$CYAN $UNAME $ENDCOLOR'to run Musicbrainz...'
# echo "MB_USER="$UNAME >> musicbrainz
# sudo mv musicbrainz /etc/default/

# echo
# sleep 1

# echo -e $YELLOW'--->Enabling Musicbrainz AutoStart at Boot...'$ENDCOLOR
# sudo cp ubuntu /etc/init.d/musicbrainz || { echo $RED'Creating init file failed.'$ENDCOLOR ; exit 1; }
# sudo chown $UNAME: /etc/init.d/musicbrainz
# sudo chmod +x /etc/init.d/musicbrainz
# sudo update-rc.d musicbrainz defaults

# echo
# sleep 1

# echo -e 'Stashing any changes made to Musicbrainz...'
#source $SCRIPTPATH/inc/gitstash.sh

echo
sleep 1

# echo -e 'Starting Musicbrainz'
# sudo /etc/init.d/musicbrainz start >/dev/null 2>&1
# echo
# echo -e $GREEN'--->All done. '$ENDCOLOR
# echo -e 'Musicbrainz should start within 10-20 seconds and your browser should open.'
# echo -e 'If not you can start it using '$CYAN'/etc/init.d/Musicbrainz start'$ENDCOLOR' command.'
# echo -e 'Then open '$CYAN'http://localhost:5050'$ENDCOLOR' in your browser.'
# echo
# echo -e $YELLOW'If this script worked for you, please visit '$CYAN'http://www.htpcBeginner.com'$YELLOW' and like/follow us.'$ENDCOLOR
# echo -e $YELLOW'Thank you for using the AtoMiC Musicbrainz Install script from www.htpcBeginner.com.'$ENDCOLOR 
# echo
# pause 'Press [Enter] key to continue...'
# cd $SCRIPTPATH
# sudo bash setup.sh
# exit 0

# echo -e $YELLOW'--->Checking for previous versions of Musicbrainz...'$ENDCOLOR
# sleep 1
# sudo /etc/init.d/musicbrainz stop >/dev/null 2>&1
# echo -e 'Any running Musicbrainz processes stopped'
# sleep 1
# sudo update-rc.d -f musicbrainz remove >/dev/null 2>&1
# sudo rm /etc/init.d/musicbrainz >/dev/null 2>&1
# sudo rm /etc/default/musicbrainz >/dev/null 2>&1
# echo -e 'Existing Musicbrainz init scripts removed'
# sleep 1
# sudo update-rc.d -f musicbrainz remove >/dev/null 2>&1
# if [ -d "/home/$UNAME/.musicbrainz" ]; then
	# mv /home/$UNAME/.musicbrainz /home/$UNAME/.musicbrainz_`date '+%m-%d-%Y_%H-%M'` >/dev/null 2>&1
	# echo -e 'Existing Musicbrainz files were moved to '$CYAN'/home/'$UNAME'/.musicbrainz_'`date '+%m-%d-%Y_%H-%M'`$ENDCOLOR
# fi
# echo
# sleep 1

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh
