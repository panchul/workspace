#!/bin/bash

if [ ! -d /home/vagrant/kafka-manager ]; then
    sudo /home/vagrant/tmp_provisioning/kafka_manager_install.sh
fi

# TODO: do it the right way, package and turn into a service.

cd /home/vagrant/kafka-manager

#
# TODO: I think I ended up having to do the packaging and run the app instead
#
sudo ./sbt run

# make sure the application.config file has a good zookeeper to keep the data at.

# .sbt clean dist

# go to target/universal, do
# sudo bin/kafka-manager -Dhttp.port=80 &


