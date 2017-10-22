#!/bin/bash

if [ ! -d /home/vagrant/kafkacat ]; then
    sudo ~/tmp_provisioning/jdk_install.sh
    git clone git://github.com/panchul/kafkacat.git /home/vagrant/kafkacat
else
  echo "[INFO] Skipping installing kafkacat - it seem to be already installed, found /home/vagrant/kafkacat "
fi

