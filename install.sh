#!/bin/bash

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Configure user nobody to match unRAID's settings
usermod -u 99 nobody
usermod -g 100 nobody
usermod -d /home nobody
chown -R nobody:users /home

# Disable SSH
rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

#########################################
##             DEPENDENCIES            ##
#########################################

# Install Dependencies
apt-get update -qq
apt-get install -qy python wget git python-lxml

#########################################
##             INSTALLATION            ##
#########################################

# Install Couchpotato
mkdir -p /opt/couchpotato
/usr/bin/wget -qO - https://github.com/RuudBurger/CouchPotatoServer/archive/build/2.6.1.tar.gz | tar -C /opt/couchpotato -zx --strip-components 1

#########################################
##                 CLEANUP             ##
#########################################

# Clean APT install files
apt-get clean -y
rm -rf /var/lib/apt/lists/* /var/cache/* /var/tmp/*
