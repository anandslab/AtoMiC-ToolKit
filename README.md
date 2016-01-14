# AtoMiC-ToolKit
<img src="http://www.htpcbeginner.com/images/2015/04/atomic-toolkit-300x162.jpg" alt="AtoMiC ToolKit form htpcBeginner.com" width="300" height="162" align="right"/>AtoMiC ToolKit (<b><i>A</i></b>u<b><i>to</i></b>mate your <b><i>M</i></b>ed<b><i>i</i></b>a <b><i>C</i></b>enter) is a tool that is developed by www.htpcbeginner.com to simplify installing and managing apps / software on Ubuntu based HTPC, NAS, or Home Server setup. Essentially the AtoMiC ToolKit automates several processes and makes installing, uninstalling, and maintaining download server apps. 

<h2>Compatibility</h2>
Ubuntu (14.04, 14.10, and 15.04) and variants (Kubuntu, Xubuntu, Lubuntu) and Linux Mint. May work on other distributions but that has not been tested.

<h2>Key Features</h2>
Features features of AtoMiC ToolKit include:
<ul>
<li>Works on Ubuntu, Ubuntu Server, and other Ubuntu variants including Xubuntu, Lubuntu, Kubuntu, and more</li>
<li>Almost entirely automated</li>
<li>Very little commandline work</li>
<li>User- and newie-friendly</li>
<li>One-stop shop
<ul>
<li>Sick Beard - Install, Uninstall, and Backup / Restore</li>
<li>SickRage - Install, Uninstall, and Backup / Restore</li>
<li>SickGear - Install, Uninstall, and Backup / Restore</li>
<li>Sonarr (formerly NzbDrone) - Install, Uninstall, and Backup / Restore</li>
<li>CouchPotato - Install, Uninstall, and Backup / Restore</li>
<li>Transmission WebUI - Install, Uninstall, and Backup / Restore</li>
<li>qBittorrent WebUI - Install and Uninstall</li>
<li>SABnzbd+ - Install and Uninstall</li>
<li>Headphones - Install and Uninstall</li>
<li>HTPC Manager - Install and Uninstall</li>
<li>Mylar - Install and Uninstall</li>
<li>Plex - Install</li>
<li>Deluge - Install</li>
<li>MusicBrainz - Install</li>
<li>Webmin - Install</li>
<li>Planned - NZBGet, RTorrent/RUTorrent, Monit, ShellInABox</li>
</ul></li>
<li>Reset forgotten WebUI passwords</li>
<li>Makes moving apps between different computers easier</li>
<li>Correctly sets required permissions for trouble free downloads</li>
<li>Allows running multiple apps (Sick Beard, SickRage, and SickGear) simultaneously for testing</li>
<li>And best of all its FREE!</li>
</ul>

Note that AtoMiC ToolKit will be continueous development. While extensive testing has been done, there may be errors or unexpected behaviors at times. Also, not all features have been implemented yet. 

<h2>Installation and Usage</h2>
Clone repository on any Ubuntu based distro and execute the setup.sh bash script file. 

<pre>
$ sudo apt-get install git-core
$ git clone https://github.com/htpcBeginner/AtoMiC-ToolKit
$ cd ~/AtoMiC-ToolKit
$ sudo chmod 755 *
$ sudo ./setup.sh
</pre>

<h2>Default Usernames and Passwords</h2>
In case you forget to note down the default port, username, and password after installation, here they are: 

<ul>
<li>Sick Beard - Port: 8081, Username: none, Password: none</li>
<li>SickRage - Port: 8081, Username: none, Password: none</li>
<li>SickGear - Port: 8081, Username: none, Password: none</li>
<li>Sonarr - Port: 8989, Username: none, Password: none</li>
<li>CouchPotato - Port: 5050, Username: none, Password: none</li>
<li>Transmission - Port: 9091, Username: transmission, Password: transmission</li>
<li>qBittorrent - Port: 8086, Username: admin, Password: adminadmin</li>
<li>SABNzbd - Port: 8080, Username: none, Password: none</li>
<li>Headphones - Port: 8181, Username: none, Password: none</li>
<li>HTPC Manager - Port: 8085, Username: none, Password: none</li>
<li>Mylar - Port: 8090, Username: none, Password: none</li>
</ul>

It is recommended that you set / update usernames and password for all services. 

For more information on installation and usage, visit <a href="http://www.htpcbeginner.com/atomic-toolkit/">AtoMiC ToolKit</a> page on on htpcBeginner.com.
