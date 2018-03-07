RaspiWiFi

RaspiWiFi is a program to headlessly configure a Raspberry Pi's WiFi 
connection using using any other WiFi-enabled device (much like the way 
a Chromecast or similar device can be configured). RaspiWiFi has been 
tested with the Raspberry Pi B+, Raspberry Pi 3, and Raspberry Pi Zero W.

--  This version has been updated for use in Raspbian stretch (as of November 2017 release) --
--  This version no longer effects /etc/network/interfaces.  It now configures via /etc/dhcpcd.conf and runs dnsmasq for DNS server instead of isc-dhcp-server.  



INSTALLATION INSTRUCTIONS:

== To install:

git clone https://github.com/bottleworks/RaspiWiFi.git
cd RaspiWiFi
sudo sh start.sh

== This script will install all necessary prerequisites, copy configuration files, and reboot. When it finishes booting it should present itself in "Configuration Mode" as a WiFi access point with the name "NameOfNetwork".  




USAGE:

== Connect to the "NameOfNetwork" access point using any other WiFi enabled device.  The default password is "password12345".  
You can modify the SSID and password at /usr/share/configure_wifi/Reset_Device/static_files/hostapd.conf

== If you run a non-stock /etc/rc.local, modify rc.local.apclient and rc.local.apclient.template /usr/share/configure_wifi/Reset_Device/static_files/
/etc/rc.local will be overwritten EVERYTIME the system configured to act as a wifi access point for setting up a new network.
If you happen to need a non-stock rc.local during the short time when the system is in the "configure wifi" configuration, modify rc.local.aphost and rc.local.aphost.template .

If you happen to operate a service which needs port 80, such as the Apache Web Server, then you need to stop the process in rc.local.aphost and rc.local.aphost.template --BEFORE--
su -c "cd /usr/share/configure_wifi/Configuration_App/ && rails s -b 10.0.0.1 -e production -p 80 -d" &
An example is provided.

== Navigate to http://10.0.0.1 using any web browser on the device you connected with.  It takes several minutes before the server is ready to accept requests.  If you're connected to the Pi via wifi and it gave you an IP, but the web page is timing out, then just wait a couple minutes....

== Select the WiFi connection you'd like your Raspberry Pi to connect to from the drop down list and enter its wireless password on the page provided. If no encryption is enabled, leave the password box blank.

== Click the "Connect" button.

== At this point your Raspberry Pi will reboot and connect to the access point specified.

The files for this process are stored in /usr/share/configure_wifi .  



RESETTING THE DEVICE:

== If GPIO 4 is pulled HIGH for 10 seconds or more the Raspberry Pi will reset all settings, reboot, and enter "Configuration Mode" again. It's useful to have a simple button wired on GPIO 4 to reset easily if moving to a new location, or if incorrect connection information is ever entered. Just press and hold for 10 seconds or longer.

== You can also reset the device by running: 
sudo python3 /usr/share/configure_wifi/Reset_Device/manual-reset.py
