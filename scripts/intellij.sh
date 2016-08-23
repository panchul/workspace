#!/usr/bin/env bash

if [ ! -d idea-IC-162.1121.32 ]; then
  if [ ! -f /home/vagrant/tmp_provisiong/idea.tar.gz ]; then
    if [ ! -f /vagrant/install/ideaIC-2016.2.tar.gz  ]; then
      wget -O /vagrant/install/ideaIC-2016.2.tar.gz https://download.jetbrains.com/idea/ideaIC-2016.2.tar.gz 
    else
      cp /vagrant/install/ideaIC-2016.2.tar.gz /home/vagrant/tmp_provisiong/idea.tar.gz 
    fi
  fi
  tar xzf /home/vagrant/tmp_provisiong/idea.tar.gz 
  echo "PATH=\$PATH:~/idea-IC-162.1121.32/bin" >> /home/vagrant/.bashrc
fi


