#!/usr/bin/env bash

if [ ! -d /home/vagrant/sbt ]; then
  if [ ! -f /home/vagrant/tmp_provisioning/sbt.tgz ]; then
    if [ ! -f /vagrant/install/sbt-0.13.12.tgz  ]; then
      echo "Downloading sbt to install/ folder"
      wget -O /vagrant/install/sbt-0.13.12.tgz https://dl.bintray.com/sbt/native-packages/sbt/0.13.12/sbt-0.13.12.tgz
    else
      echo "sbt seem to be already downloaded to install/ folder"
    fi
    echo "Copying sbt from install/ folder"
    cp /vagrant/install/sbt-0.13.12.tgz /home/vagrant/tmp_provisioning/sbt.tgz
  else
    echo "sbt seem to be already downloaded and copied from install/ folder"
    pwd
  fi
  tar xzf /home/vagrant/tmp_provisioning/sbt.tgz -C /home/vagrant
  echo "PATH=\$PATH:/home/vagrant/sbt/bin" >> /home/vagrant/.bashrc
else
  echo "sbt seem to be already installed"
  sbt -h
fi

# TODO: Replace the following with using specific package, from /install dir.
# sync the list
sudo apt-get -y update
sudo apt-get -y install scala

