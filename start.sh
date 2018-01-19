#!/bin/sh -e
echo "Setting up file structure..."
mv "Configuration App" Configuration_App
mv "Reset Device" Reset_Device
rm -rf /usr/share/configure_wifi
mkdir /usr/share/configure_wifi
chmod 775 /usr/share/configure_wifi
cp -r * /usr/share/configure_wifi
chmod 775 /usr/share/configure_wifi/start_server.sh
echo "Starting Main installer script..."
python3 /usr/share/configure_wifi/initial_setup.py
