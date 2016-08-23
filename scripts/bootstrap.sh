#!/usr/bin/env bash

# do all the provisioning in a dedicated place we can remove to save space
mkdir -p /home/vagrant/tmp_provisioning

# Occationally \r slips in, let's be ready.
dos2unix -n /vagrant/scripts/init.sh /home/vagrant/tmp_provisioning/init.sh
dos2unix -n /vagrant/scripts/git.sh /home/vagrant/tmp_provisioning/git.sh
dos2unix -n /vagrant/scripts/jdk.sh /home/vagrant/tmp_provisioning/jdk.sh
dos2unix -n /vagrant/scripts/intellij.sh /home/vagrant/tmp_provisioning/intellij.sh
dos2unix -n /vagrant/scripts/scala.sh /home/vagrant/tmp_provisioning/scala.sh
dos2unix -n /vagrant/scripts/erlang.sh /home/vagrant/tmp_provisioning/erlang.sh
chmod +x /home/vagrant/tmp_provisioning/*.sh
dos2unix -n /vagrant/config/hosts_append.txt /home/vagrant/tmp_provisioning/hosts_append.txt
chown --recursive vagrant:vagrant /home/vagrant/tmp_provisioning
sudo cat /home/vagrant/tmp_provisioning/hosts_append.txt >> /etc/hosts

# These are optional, but for now let's throw them all into the defult set
#tmp/git.sh
#tmp/jdk.sh
#tmp/scala.sh
#tmp/intellij.sh


/home/vagrant/tmp_provisioning/init.sh
