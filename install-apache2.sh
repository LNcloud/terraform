#this script is useful to install apache server


#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y sudo su
echo "Custom html page" > /var/www/html/index.html
