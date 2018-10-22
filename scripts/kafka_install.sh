#!/usr/bin/env bash

WHERE_I_STARTED_PWD=`pwd`

ls $(dirname $0)/kafka_env.sh
mystatus=$?

if test $mystatus -eq 0 ; then
echo " "
echo "kafkf_env.sh found, getting definitions from it..."
    source $(dirname $0)/kafka_env.sh
else
echo " "
echo "WARNING: kafkf_env.sh is NOT found, using default values instead..."
#KAFKA_VERSION="0.8.2.2"
#KAFKA_VERSION="0.10.0.1"
KAFKA_VERSION="0.11.0.0"
KAFKA_NAME="kafka_2.11-$KAFKA_VERSION"
KAFKA_INSTALLER_DIR="/vagrant/install"
KAFKA_DEPLOYMENT_DIR="/home/vagrant"
KAFKA_CONFIG_DIR="/vagrant/config"
# If we spread them around, we might also want to spread around the ports
#KAFKA_RUN_DIR="/tmp/kafka$1"
KAFKA_RUN_DIR="/data/kafka"

fi


if [[ -z ${KAFKA_INSTALLER_DIR} ]] ; then
    echo " "
    echo "ERROR: KAFKA_INSTALLER_DIR is not defined !"
    exit 1;
fi

if [[ -z ${KAFKA_DEPLOYMENT_DIR} ]] ; then
    echo " "
    echo "ERROR: KAFKA_DEPLOYMENT_DIR is not defined !"
    exit 1;
fi

if [[ -z ${KAFKA_NAME} ]] ; then
    echo " "
    echo "ERROR: KAFKA_NAME is not defined !"
    exit 1;
fi

if [[ -z ${KAFKA_VERSION} ]] ; then
    echo " "
    echo "ERROR: KAFKA_VERSION is not defined !"
    exit 1;
fi

if [[ -z ${KAFKA_RUN_DIR} ]] ; then
    echo " "
    echo "ERROR: KAFKA_RUN_DIR is not defined !"
    exit 1;
fi


if [ ! -f  $KAFKA_INSTALLER_DIR/$KAFKA_NAME.tgz ]; then
   echo "[INFO] Downloading Kafka($KAFKA_INSTALLER_DIR/$KAFKA_NAME.tgz) ..."
   wget -O "$KAFKA_INSTALLER_DIR/$KAFKA_NAME.tgz" http://apache.claz.org/kafka/"$KAFKA_VERSION/$KAFKA_NAME.tgz"
else
   echo "[INFO] Skipping downloading Kafka: have $KAFKA_INSTALLER_DIR/$KAFKA_NAME.tgz"
fi

if [ ! -d "$KAFKA_DEPLOYMENT_DIR/$KAFKA_NAME" ]; then

   sudo $(dirname $0)/jdk_install.sh

   echo "[INFO] Installing Kafka ..."
   tar -zxf $KAFKA_INSTALLER_DIR/$KAFKA_NAME.tgz -C $KAFKA_DEPLOYMENT_DIR
   echo "export PATH=\$PATH:$KAFKA_DEPLOYMENT_DIR/$KAFKA_NAME/bin/" >> /home/vagrant/.bashrc
   echo "export WS_KAFKA_VERSION=$KAFKA_VERSION" >> /home/vagrant/.bashrc
   chown vagrant:vagrant -R "$KAFKA_DEPLOYMENT_DIR/$KAFKA_NAME"
else
   echo "[INFO] Skipping unpacking Kafka: $KAFKA_DEPLOYMENT_DIR/$KAFKA_NAME is present"
fi

if [ ! -d $KAFKA_RUN_DIR ]; then
   echo "[INFO] Creating kafka data dir $KAFKA_RUN_DIR ..."
   sudo mkdir -p $KAFKA_RUN_DIR
   sudo chown vagrant:vagrant -R $KAFKA_RUN_DIR
fi

cd $WHERE_I_STARTED_PWD
