# UPDATE AND UPGRADE
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'

# PACKAGE MANAGEMENT
alias install='sudo apt-get install'
alias uninstall='sudo apt-get remove'
alias aptsearch='sudo apt-cache search'
alias addkey='sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com'
alias finstall='sudo apt-get -f install'
alias rinstall='sudo apt-get -f install --reinstall'

# FILE CLEANING
alias clean='sudo apt-get clean && sudo apt-get autoclean'
alias remove='sudo apt-get remove && sudo apt-get autoremove'
alias purge='sudo apt-get purge'
alias deborphan='sudo deborphan | xargs sudo apt-get -y remove --purge'
alias cleanall='clean && remove && deborphan && purge'

# SHUTDOWN AND RESTART
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'

# APPLICATIONS
alias nano='sudo nano -iSw$'
alias bashupdate='. ~/.bashrc'
alias scp='scp -c blowfish -r'
alias make='make -j4'

# FILE OPERATIONS
alias fdisk='sudo fdisk -l'
alias uuid='sudo vol_id -u'
alias rd='sudo rm -R'
alias rfind='sudo find / -name'
alias rrsync='sudo rsync --verbose -rtvogp --progress --force --delete'
alias ll='ls -alh'
alias cp='cp --verbose'
alias mv='mv --verbose'
alias dirsize='sudo du -hx --max-depth=1'
alias usdb='sudo umount /dev/sdb*'

# GRUB
alias grubu='sudo update-grub'
alias grubi='sudo grub-install'

# SERVICES
alias apacherestart='sudo service apache2 reload'
alias apachestop='sudo service apache2 stop'
alias apachestart='sudo service apache2 start'

alias networkrestart='sudo service networking restart'
alias networkstop='sudo service networking stop'
alias networkstart='sudo service networking start'

alias sambarestart='sudo service smbd restart'
alias sambastop='sudo service smbd stop'
alias sambastart='sudo service smbd start'

alias nfsrestart='sudo service nfs-kernel-server restart'
alias nfsstart='sudo service nfs-kernel-server start'
alias nfsstop='sudo service nfs-kernel-server stop'

# PVR, TORRENTS, AND USENET
alias qbitstart='sudo service qbittorrent-nox-daemon start'
alias qbitstop='sudo service qbittorrent-nox-daemon stop'
alias qbitrestart='sudo service qbittorrent-nox-daemon restart'

alias transstop='sudo service transmission-daemon stop'
alias transstart='sudo service transmission-daemon start'
alias transrestart='sudo service transmission-daemon reload'

alias couchstop='sudo service couchpotato stop'
alias couchstart='sudo service couchpotato start'
alias couchrestart='sudo service couchpotato stop ; sudo service couchpotato start'

alias sickstop='sudo service sickbeard stop'
alias sickstart='sudo service sickbeard start'
alias sickrestart='sudo service sickbeard stop ; sudo service sickbeard start'

alias sabstop='sudo service sabnzbdplus stop'
alias sabstart='sudo service sabnzbdplus start'
alias sabrestart='sudo service sabnzbdplus restart'

alias headstop='sudo service headphones stop'
alias headstart='sudo service headphones start'
alias headrestart='sudo service headphones restart'
