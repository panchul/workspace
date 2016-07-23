#!/usr/bin/env bash

if [ ! -d sbt ]; then
  if [ ! -f tmp/sbt.tgz ]; then
    if [ ! -f /vagrant/install/sbt-0.13.12.tgz  ]; then
      wget -O tmp/idea.tar.gz https://dl.bintray.com/sbt/native-packages/sbt/0.13.12/sbt-0.13.12.tgz 
    else
      cp /vagrant/install/sbt-0.13.12.tgz tmp/sbt.tgz 
    fi
  fi
  tar xzf tmp/sbt.tgz 
  echo "PATH=\$PATH:~/sbt/bin" >> /home/vagrant/.bashrc
fi

