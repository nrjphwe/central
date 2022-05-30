#!/bin/bash
#trap 'read -p "run: $BASH_COMMAND "' DEBUG

#set -e
set -x

cd "$(dirname "$0")/.."

echo "=> Installing apache...\n"
sudo apt update
sudo apt install apache2 -y
sudo chown -R www-data:www-data /var/www/
sudo chmod -R 775 /var/www/html/
sudo usermod -a -G www-data pi
sudo a2enmod cgi

echo "=> Installing PHP...\n"
sudo apt install php php-mbstring
#sudo apt install php libapache2-mod-php -y
sudo -u www-data touch /var/www/html/index.php
echo "<?php phpinfo ();?>" |  sudo tee -a /var/www/html/index.php

# start upp VNC
echo " VNC"
sudo apt install realvnc-vnc-server realvnc-vnc-viewer
sudo vncpasswd -service
echo  "Authentication=VncAuth" | sudo tee -a  /etc/vnc/config.d/common.custom
# sudo systemctl start vncserver-x11-serviced.service
sudo systemctl enable vncserver-x11-serviced.service
sudo systemctl restart vncserver-x11-serviced
