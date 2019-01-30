#!/usr/bin/env bash

# switch to the domestic repository
sudo sed -i".bak" -e 's/\/\/archive.ubuntu.com/\/\/ftp.jaist.ac.jp/g'  /etc/apt/sources.list

# apt update
yes | sudo apt-get -y update

# apt upgrade
yes | sudo apt-get -y upgrade

# change timezone
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# apache2 install
yes | sudo apt-get -y install apache2

# Correct errors occurring at 'service apache2 start'
# Invalid argument: AH00076: Failed to enable APR_TCP_DEFER_ACCEPT
echo AcceptFilter http none >>/etc/apache2/apache2.conf
echo AcceptFilter https none >>/etc/apache2/apache2.conf

# PHP install
sudo apt-get -y install php7.2
sudo apt-get -y install php-pear php7.2-fpm php7.2-dev php7.2-zip php7.2-curl php7.2-xmlrpc php7.2-gd php7.2-mysql php7.2-mbstring php7.2-xml libapache2-mod-php7.2
