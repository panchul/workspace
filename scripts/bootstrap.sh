#!/usr/bin/env bash

# do all the provisioning in a dedicated place we can remove to save space
mkdir -p /home/vagrant/tmp_provisioning

# Occationally \r slips in, let's be ready.

for myscript in `ls /vagrant/scripts/*.sh` ; do \
dos2unix -q -n $myscript /home/vagrant/tmp_provisioning/$(basename $myscript) ; done

# -------------------------------------

dos2unix -q -n /vagrant/config/hosts_append.txt /home/vagrant/tmp_provisioning/hosts_append.txt

# TODO: we probably should not be doing this.
chown --recursive vagrant:vagrant /home/vagrant/tmp_provisioning

# Ansible way is better, we might be duplicating the records.
sudo cat /home/vagrant/tmp_provisioning/hosts_append.txt >> /etc/hosts

# /home/vagrant/tmp_provisioning/init.sh
