#!/usr/bin/env bash

# do all the provisioning in a dedicated place we can remove to save space
mkdir -p /home/vagrant/tmp_provisioning

# Occationally \r slips in, let's be ready.

# vi, updates, browser plugins.
dos2unix -q -n /vagrant/scripts/init.sh /home/vagrant/tmp_provisioning/init.sh

# git, vcs tools, etc.
dos2unix -q -n /vagrant/scripts/git.sh /home/vagrant/tmp_provisioning/git.sh

# jdk
dos2unix -q -n /vagrant/scripts/jdk.sh /home/vagrant/tmp_provisioning/jdk.sh

# intellij
dos2unix -q -n /vagrant/scripts/intellij.sh /home/vagrant/tmp_provisioning/intellij.sh

# sbt
dos2unix -q -n /vagrant/scripts/sbt.sh /home/vagrant/tmp_provisioning/sbt.sh

# scala
dos2unix -q -n /vagrant/scripts/scala.sh /home/vagrant/tmp_provisioning/scala.sh

# erlang
dos2unix -q -n /vagrant/scripts/erlang.sh /home/vagrant/tmp_provisioning/erlang.sh

# apache spark
dos2unix -q -n /vagrant/scripts/spark.sh /home/vagrant/tmp_provisioning/spark.sh

# apache zookeeper
dos2unix -q -n /vagrant/scripts/zookeeper.sh /home/vagrant/tmp_provisioning/zookeeper.sh

# apache kafka
dos2unix -q -n /vagrant/scripts/kafka.sh /home/vagrant/tmp_provisioning/kafka.sh

# golang
dos2unix -q -n /vagrant/scripts/golang.sh /home/vagrant/tmp_provisioning/golang.sh

# -------------------------------------

dos2unix -q -n /vagrant/config/hosts_append.txt /home/vagrant/tmp_provisioning/hosts_append.txt

# TODO: we probably should not be doing this.
chown --recursive vagrant:vagrant /home/vagrant/tmp_provisioning

# Ansible way is better, we might be duplicating the records.
sudo cat /home/vagrant/tmp_provisioning/hosts_append.txt >> /etc/hosts

# These are optional, but for now let's throw them all into the defult set
#tmp/git.sh
#tmp/jdk.sh
#tmp/scala.sh
#tmp/intellij.sh

# /home/vagrant/tmp_provisioning/init.sh
