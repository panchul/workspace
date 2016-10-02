#!/usr/bin/env bash

KAFKA_VERSION="0.10.0.1"
KAFKA_NAME="kafka_2.11-$KAFKA_VERSION"
KAFKA_INSTALL_DIR="/vagrant/install"

if [ ! -f  $KAFKA_INSTALL_DIR/$KAFKA_NAME.tgz ]; then
   echo "[INFO] Downloading Kafka($KAFKA_INSTALL_DIR/$KAFKA_NAME.tgz) ..."
   wget -O "$KAFKA_INSTALL_DIR/$KAFKA_NAME.tgz" http://apache.claz.org/kafka/"$KAFKA_VERSION/$KAFKA_NAME.tgz"
else
   echo "[INFO] Skipping downloading Kafka: hav $KAFKA_INSTALL_DIR/$KAFKA_NAME.tgz"
fi

if [ ! -d /home/vagrant/$KAFKA_NAME ]; then
   echo "[INFO] Installing Kafka ..."
   tar -zxf $KAFKA_INSTALL_DIR/$KAFKA_NAME.tgz -C /home/vagrant
   echo "export PATH=\$PATH:/home/vagrant/$KAFKA_NAME/bin/" >> /home/vagrant/.bashrc
   chown vagrant:vagrant -R /home/vagrant/$KAFKA_NAME
else
   echo "[INFO] Skipping unpacking Kafka: /home/vagrant/$KAFKA_NAME is present"
fi

