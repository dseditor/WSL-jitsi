#!/bin/bash
sudo apt install openssh-server
sudo apt update
sudo ufw allow OpenSSH
sudo ufw allow http
sudo ufw allow https
sudo ufw allow in 10000:20000/udp
sudo ufw enable
sudo apt update
sudo apt install -y openjdk-8-jre-headless
echo "JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" | sudo tee -a /etc/profile
source /etc/profile
sudo apt install -y nginx
sudo apt-key add jitsi-key.gpg.key
sudo sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"
sudo apt update -y
sudo apt install -y jitsi-meet
sudo /etc/init.d/nginx start 
sudo /etc/init.d/jicofo start 
sudo /etc/init.d/jitsi-videobridge2 start
sudo /etc/init.d/prosody start 
