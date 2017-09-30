#!/bin/bash

if [ ! -d /home/vagrant/kafka-manager ]; then
    sudo ~/tmp_provisioning/jdk_install.sh
    git clone git://github.com/panchul/kafka-manager.git /home/vagrant/kafka-manager
else
  echo "[INFO] Skipping installing kafka-manager - it seem to be already installed, found /home/vagrant/kafka-manage "
fi

# TODO: do the packaging right
#cd kafka-manager
#sudo ./sbt run

