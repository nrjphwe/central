#!/bin/bash
#trap 'read -p "run: $BASH_COMMAND "' DEBUG

#set -e
set -x

cd "$(dirname "$0")/.."

echo  "Authentication=VncAuth" | sudo tee -a  /etc/vnc/config.d/common.custom

echo "=> Installing apache...\n"
sudo apt update
sudo apt install apache2 -y
sudo a2enmod cgi

echo "=> Installing PHP...\n"
sudo apt install php libapache2-mod-php -y

# start upp VNC
echo " VNC"
sudo vncpasswd -service
# sudo systemctl start vncserver-x11-serviced.service
# sudo systemctl enable vncserver-x11-serviced.service
sudo systemctl restart vncserver-x11-serviced

# We have a script "listen-for-shutdown.py", which will shutdown the PI when triggered by a switch.  
# We need to start this script on boot. So we'll place the script in /usr/local/bin and make it executable:
sudo cp listen-for-shutdown.py /usr/local/bin/
sudo chmod +x /usr/local/bin/listen-for-shutdown.py

# Now add another script called listen-for-shutdown.sh that will start/stop our service.
# Place this file in /etc/init.d and make it executable.
sudo cp listen-for-shutdown.sh /etc/init.d/
sudo chmod +x /etc/init.d/listen-for-shutdown.sh
# Now we'll register the script to run on boot.
sudo update-rc.d listen-for-shutdown.sh defaults
