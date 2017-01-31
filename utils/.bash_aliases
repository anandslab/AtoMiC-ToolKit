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

alias shellrestart='sudo /etc/init.d/shellinabox reload'
alias shellstop='sudo /etc/init.d/shellinabox stop'
alias shellstart='sudo /etc/init.d/shellinabox start'
alias shellstatus='sudo /etc/init.d/shellinabox status'

alias webminrestart='sudo /etc/init.d/webmin reload'
alias webminstop='sudo /etc/init.d/webmin stop'
alias webminstart='sudo /etc/init.d/webmin start'
alias webminstatus='sudo /etc/init.d/webmin status'

# PVR, TORRENTS, AND USENET
alias qbitstart='sudo /etc/init.d/qbittorrent-nox start'
alias qbitstop='sudo /etc/init.d/qbittorrent-nox stop'
alias qbitrestart='sudo /etc/init.d/qbittorrent-nox restart'
alias qbitstatus='sudo /etc/init.d/qbittorrent-nox status'

alias transstop='sudo /etc/init.d/transmission-daemon stop'
alias transstart='sudo /etc/init.d/transmission-daemon start'
alias transrestart='sudo /etc/init.d/transmission-daemon reload'
alias transstatus='sudo /etc/init.d/transmission-daemon status'

alias couchstop='sudo /etc/init.d/couchpotato stop'
alias couchstart='sudo /etc/init.d/couchpotato start'
alias couchrestart='sudo /etc/init.d/couchpotato stop ; sudo /etc/init.d/couchpotato start'
alias couchstatus='sudo /etc/init.d/couchpotato status'

alias ragestop='sudo /etc/init.d/sickrage stop'
alias ragestart='sudo /etc/init.d/sickrage start'
alias ragerestart='sudo /etc/init.d/sickrage stop ; sudo /etc/init.d/sickrage start'
alias ragestatus='sudo /etc/init.d/sickrage status'

alias gearstop='sudo /etc/init.d/sickgear stop'
alias gearstart='sudo /etc/init.d/sickgear start'
alias gearrestart='sudo /etc/init.d/sickgear stop ; sudo /etc/init.d/sickgear start'
alias gearstatus='sudo /etc/init.d/sickgear status'

alias sabstop='sudo /etc/init.d/sabnzbdplus stop'
alias sabstart='sudo /etc/init.d/sabnzbdplus start'
alias sabrestart='sudo /etc/init.d/sabnzbdplus restart'
alias sabstatus='sudo /etc/init.d/sabnzbdplus status'

alias headstop='sudo /etc/init.d/headphones stop'
alias headstart='sudo /etc/init.d/headphones start'
alias headrestart='sudo /etc/init.d/headphones restart'
alias headstatus='sudo /etc/init.d/headphones status'

alias mylarstop='sudo /etc/init.d/mylar stop'
alias mylarstart='sudo /etc/init.d/mylar start'
alias mylarrestart='sudo /etc/init.d/mylar restart'
alias mylarstatus='sudo /etc/init.d/mylar status'

alias htpcstop='sudo /etc/init.d/htpcmanager stop'
alias htpcstart='sudo /etc/init.d/htpcmanager start'
alias htpcrestart='sudo /etc/init.d/htpcmanager restart'
