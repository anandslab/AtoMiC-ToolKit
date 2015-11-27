AtoMiC ToolKit form htpcBeginner.comAtoMiC ToolKit (Automate your Media Center) is a tool that is developed by www.htpcbeginner.com to simplify installing and managing apps / software on Ubuntu based HTPC, NAS, or Home Server setup.

Essentially the AtoMiC ToolKit automates several processes and makes installing, uninstalling, and maintaining download server apps.

Compatibility
Ubuntu (14.04, 14.10, and 15.04) and variants (Kubuntu, Xubuntu, Lubuntu) and Linux Mint. May work on other distributions but that has not been tested.

Key Features
Features features of AtoMiC ToolKit include:
* Works on Ubuntu, Ubuntu Server, and other Ubuntu variants including Xubuntu, Lubuntu, Kubuntu, and more
* Almost entirely automated
* Very little commandline work
* User- and newie-friendly
* One-stop shop
* Sick Beard - Install, Uninstall, and Backup / Restore
* SickRage - Install, Uninstall, and Backup / Restore
* SickGear - Install, Uninstall, and Backup / Restore
* Sonarr (formerly NzbDrone) - Install, Uninstall, and Backup / Restore
* CouchPotato - Install, Uninstall, and Backup / Restore
* Transmission WebUI - Install, Uninstall, and Backup / Restore
* qBittorrent WebUI - Install and Uninstall
* SABnzbd+ - Install and Uninstall
* Headphones - Install and Uninstall
* HTPC Manager - Install and Uninstall
* Mylar - Install and Uninstall
* Planned - NZBGet, Plex, Deluge, RTorrent/RUTorrent
    - Reset forgotten WebUI passwords
    - Makes moving apps between different computers easier
    - Correctly sets required permissions for trouble free downloads
    - Allows running multiple apps (Sick Beard, SickRage, and SickGear) simultaneously for testing
* And best of all its FREE!

Note that AtoMiC ToolKit will be continueous development. While extensive testing has been done, there may be errors or unexpected behaviors at times. Also, not all features have been implemented yet.

Installation and Usage:
Clone repository on any Ubuntu based distro and execute the setup.sh bash script file.

    $ sudo apt-get install git-core
    $ git clone https://github.com/htpcBeginner/AtoMiC-ToolKit
    $ cd ~/AtoMiC-ToolKit
    $ sudo ./setup.sh

Default Usernames and Passwords:
In case you forget to note down the default port, username, and password after installation, here they are:

* Sick Beard - Port: 8081, Username: none, Password: none
* SickRage - Port: 8081, Username: none, Password: none
* SickGear - Port: 8081, Username: none, Password: none
* Sonarr - Port: 8989, Username: none, Password: none
* CouchPotato - Port: 5050, Username: none, Password: none
* Transmission - Port: 9091, Username: transmission, Password: transmission
* qBittorrent - Port: 8086, Username: admin, Password: adminadmin
* SABNzbd - Port: 8080, Username: none, Password: none
* Headphones - Port: 8181, Username: none, Password: none
* HTPC Manager - Port: 8085, Username: none, Password: none
* Mylar - Port: 8090, Username: none, Password: none

It is recommended that you set / update usernames and password for all services. 

For more information on installation and usage, visit AtoMiC ToolKit page on on htpcBeginner.com.
