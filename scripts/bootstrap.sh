#!/usr/bin/env bash

WHERE_I_STARTED_PWD=`pwd`

# do all the provisioning in a dedicated place we can remove to save space
mkdir -p /home/vagrant/tmp_provisioning

#dos2unix might not be available.
# Occationally \r slips in, let's be ready.
#for myscript in `ls /vagrant/scripts/*.sh` ; do \
#dos2unix -q -n $myscript /home/vagrant/tmp_provisioning/$(basename $myscript) \
#; done

for myscript in `ls -1 /vagrant/scripts/*.sh` ; do \
  cp $myscript /home/vagrant/tmp_provisioning/$(basename $myscript) ; \
done

# -------------------------------------

cp /vagrant/config/hosts_append.txt /home/vagrant/tmp_provisioning/hosts_append.txt
#dos2unix might not be available.
#dos2unix -q /vagrant/config/hosts_append.txt /home/vagrant/tmp_provisioning/hosts_append.txt

# TODO: we probably should not be doing this.
chown --recursive vagrant:vagrant /home/vagrant/tmp_provisioning

# Ansible way is better, we might be duplicating the records.
sudo cat /home/vagrant/tmp_provisioning/hosts_append.txt >> /etc/hosts

# /home/vagrant/tmp_provisioning/init.sh

cd $WHERE_I_STARTED_PWD
