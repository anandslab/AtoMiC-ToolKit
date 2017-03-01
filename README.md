# AtoMiC-ToolKit
<img src="http://www.htpcbeginner.com/images/2015/04/atomic-toolkit-300x162.jpg" alt="AtoMiC ToolKit form htpcBeginner.com" width="300" height="162" align="right"/>AtoMiC ToolKit (<b><i>A</i></b>u<b><i>to</i></b>mate your <b><i>M</i></b>ed<b><i>i</i></b>a <b><i>C</i></b>enter) is a tool that is developed by htpcBeginner.com and its community to simplify installing and managing apps / software on Ubuntu based HTPC, NAS, or Home Server setup. Essentially the AtoMiC ToolKit automates several processes and makes installing, uninstalling, backing up, restoring, resetting, and maintaining download server apps. It is written in bash.

<h2>Support AtoMiC ToolKit Development</h2>
We have put in several hundred hours of work into developing AtoMiC ToolKit. If it helped you please consider donating. All donations will be used only for AtoMiC ToolKit development.

<table>
<tr>
<th style="text-align:center">BitCoin</th>
<th style="text-align:center">PayPal</th>
</tr>
<tr>
<td style="text-align:center">1FEgpS3WrK51yzJpqrSo3RXcrLDGztqKPy<br />
<img src="http://www.htpcbeginner.com/images/2016/02/hb-bitcoin74x75.png" width="74" height="75" /></td>
<td style="text-align:center"><a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=PEVRBUVEW92KQ" target="_blank"><img src="http://www.htpcbeginner.com/images/2016/02/hb-paypal128x75.png" width="128" height="75" /></a></td>
</tr>
</table>

<h2>Compatibility</h2>
Compatible with Latest Ubuntu and variants (Kubuntu, Xubuntu, Lubuntu) and Linux Mint. 
Development will focus mainly on compatibility with current Ubuntu\Debian\Raspbian releases. 
Testing has been mainly on Linux Min 18.1 and Raspbian Jessie. 

<h2>Key Features</h2>
Features features of AtoMiC ToolKit include:
<ul>
<li>Almost entirely automated</li>
<li>Very little commandline work</li>
<li>User and newbie-friendly</li>
<li>One-stop shop
<ul>
<li>CouchPotato - Install, Uninstall, Reset Password, Update and Backup / Restore</li>
<li>Deluge - Install, Uninstall, Update and Backup / Restore</li>
<li>Emby - Install, Uninstall, Update and Backup / Restore</li>
<li>Headphones - Install, Uninstall, Reset Password, Update and Backup / Restore</li>
<li>HTPC Manager - Install, Uninstall, Update and Backup / Restore</li>
<li>Jackett - Install, Uninstall, Update and Backup / Restore</li>
<li>Kodi - Install, Uninstall Autoboot enable and Update</li>
<li>Lazy Librarian - Install, Uninstall, Reset Password, Update and Backup / Restore</li>
<li>Mylar - Install, Uninstall, Reset Password, Update and Backup / Restore</li>
<li>NZBGet - Install, Uninstall, Reset Password and Backup / Restore</li>
<li>NZBHydra - Install, Uninstall, Update and Backup / Restore</li>
<li>Plex - Install, Uninstall, Update and Backup / Restore</li>
<li>pyLoad - Install, Uninstall, Reset Password, Update and Backup / Restore</li>
<li>qBittorrent - Install, Uninstall, Reset Password, Update and Backup / Restore</li>
<li>Radarr - Install, Uninstall, Update and Backup / Restore</li>
<li>SABnzbd+ - Install, Uninstall, Reset Password, Update and Backup / Restore</li>
<li>SickGear - Install, Uninstall, Reset Password, Update and Backup / Restore</li>
<li>SickRage - Install, Uninstall, Reset Password, Update and Backup / Restore</li>
<li>Sonarr - Install, Uninstall, Update and Backup / Restore</li>
<li>Transmission WebUI - Install, Uninstall, Reset Password, Update and Backup / Restore</li>
<li>Webmin - Install, Uninstall, Update and Backup / Restore</li>
<li>Planned - DuckieTV, ktorrent, Monit, MusicBrainz, Muximux, MythTV, PlexPy, Rtorrent/rutorrent, ShellInABox, Subsonic, Tvheadend, Utorrent, etc.</li>
</ul></li>
<li>Reset forgotten WebUI passwords</li>
<li>Makes moving apps between different computers easier</li>
<li>Correctly sets required permissions for trouble free operation</li>
<li>And best of all its FREE! (please consider donating if toolkit helps you.</li>
</ul>

Note that AtoMiC ToolKit will be in continueous development. While extensive testing has been done, there may be errors or unexpected behaviors at times. Also, not all features have been implemented yet. 

<h2>Installation and Usage</h2>
Clone repository on any Debian or Ubuntu based distro and execute the setup.sh bash script file. 

<pre>
$ sudo apt-get install git
$ git clone https://github.com/htpcBeginner/AtoMiC-ToolKit ~/AtoMiC-ToolKit
$ cd ~/AtoMiC-ToolKit
$ sudo bash setup.sh
</pre>

<h2>Video</h2>
<a href="https://www.youtube.com/watch?v=mEoogc0fTBo" target="_blank">https://youtu.be/Zji_3cZRcK4</a>

<h2>Screenshots</h2>
<h6>AtoMiC ToolKit Main Menu</h6>
<a href="http://www.htpcbeginner.com/images/2015/04/atomic-toolkit-main-menu.png" rel="attachment wp-att-20608"><img src="http://www.htpcbeginner.com/images/2015/04/atomic-toolkit-main-menu-500x371-1.jpg" alt="AtoMiC ToolKit Main Menu" width="500" height="371" class="size-large wp-image-20608" /></a>

<h6>AtoMiC ToolKit Submenu Example</h6>
<a href="http://www.htpcbeginner.com/images/2015/04/atomic-toolkit-sickbeard-sub-menu.png" rel="attachment wp-att-20609"><img src="http://www.htpcbeginner.com/images/2015/04/atomic-toolkit-sickbeard-sub-menu-500x370-1.jpg" alt="AtoMiC ToolKit Submenu Example" width="500" height="370" class="size-large wp-image-20609" /></a> 

<h6>AtoMiC ToolKit Script Execution Example</h6>
<a href="http://www.htpcbeginner.com/images/2015/04/atomic-toolkit-sickrage-access-details.png" rel="attachment wp-att-20610"><img src="http://www.htpcbeginner.com/images/2015/04/atomic-toolkit-sickrage-access-details-500x436-1.jpg" alt="AtoMiC ToolKit Script Execution Example" width="500" height="436" class="size-large wp-image-20610" /></a> 

<h2>Default Usernames and Passwords</h2>
Access details have now been simplified and automated. Access details for each app can be obtained through the ToolKit Menus. It is recommended that you set / update usernames and password for all services. 

For more information on installation and usage, visit <a href="http://www.htpcbeginner.com/atomic-toolkit/">AtoMiC ToolKit</a> page on on htpcBeginner.com.
