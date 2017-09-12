#!/usr/bin/env bash

# TODO: normalize the filename everywhere

if [ ! -d /home/vagrant/idea-IC-162.1121.32 ]; then
  if [ ! -f /home/vagrant/tmp_provisioning/idea.tar.gz ]; then
    if [ ! -f /vagrant/install/ideaIC-2016.2.tar.gz  ]; then
      wget -O /vagrant/install/ideaIC-2016.2.tar.gz "https://download.jetbrains.com/idea/ideaIC-2016.2.tar.gz" 
    else
      echo "[INFO] Skipping downloading IntelliJ. Found /vagrant/install/ideaIC-2016.2.tar.gz "
    fi
    cp /vagrant/install/ideaIC-2016.2.tar.gz /home/vagrant/tmp_provisioning/idea.tar.gz
  else
    echo "[WARN] Found /home/vagrant/tmp_provisioning/idea.tar.gz "
  fi
  tar xzf /home/vagrant/tmp_provisioning/idea.tar.gz -C /home/vagrant 
  echo "PATH=\$PATH:/home/vagrant/idea-IC-162.1121.32/bin" >> /home/vagrant/.bashrc
  echo "[INFO] Installed IntelliJ"
else
  echo "[INFO] Skipping installing IntelliJ - it seem to be already installed. Found /home/vagrant/idea-IC-162.1121.32 "
fi

