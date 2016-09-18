#!/usr/bin/env bash

KAFKA_VERSION="0.10.0.1"
KAFKA_NAME="kafka_2.11-$KAFKA_VERSION"
KAFKA_TARGET="/vagrant/install"

if [ ! -f  $KAFKA_TARGET/$KAFKA_NAME.tgz ]; then
   echo "Downloading Kafka($KAFKA_TARGET/$KAFKA_NAME.tgz) ..."
   mkdir -p $KAFKA_TARGET
   wget -O "$KAFKA_TARGET/$KAFKA_NAME.tgz" http://apache.claz.org/kafka/"$KAFKA_VERSION/$KAFKA_NAME.tgz"
else
   echo "Skipping downloading Kafka: the install .tgz is present ($KAFKA_TARGET/$KAFKA_NAME.tgz)"
fi

if [ ! -d /home/vagrant/$KAFKA_NAME ]; then
   echo "Installing Kafka ..."
   tar -zxf $KAFKA_TARGET/$KAFKA_NAME.tgz -C /home/vagrant/
   echo "export PATH=\$PATH:~/$KAFKA_NAME/bin/" >> /home/vagrant/.bashrc
   chown vagrant:vagrant -R /home/vagrant/$KAFKA_NAME
else
   echo "Skipping unpacking Kafka: /home/vagrant/$KAFKA_NAME is present"
fi

