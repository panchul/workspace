#!/bin/bash

if [ ! -d /home/vagrant/kafka-manager ]; then
    sudo /home/vagrant/tmp_provisioning/kafka_manager_install.sh
fi

# TODO: do it the right way, package and turn into a service.

cd /home/vagrant/kafka-manager
sudo ./sbt run

