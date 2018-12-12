#!/usr/bin/env bash

WHERE_I_STARTED_PWD=`pwd`

ls $(dirname $0)/conf_kafka_env.sh
mystatus=$?

if test $mystatus -eq 0 ; then
echo " "
echo "conf_kafka_env.sh found, getting definitions from it..."
    source $(dirname $0)/conf_kafka_env.sh
else
echo " "
echo "WARNING: conf_kafka_env.sh is NOT found, using default values instead..."
CONF_KAFKA_VERSION="5.0.1"
CONF_KAFKA_DIR_NAME="confluent-$CONF_KAFKA_VERSION"
CONF_KAFKA_NAME="confluent-$CONF_KAFKA_VERSION-2.11"
CONF_KAFKA_INSTALLER_DIR="/vagrant/install"
CONF_KAFKA_DEPLOYMENT_DIR="/home/vagrant"
CONF_KAFKA_CONFIG_DIR="/vagrant/config"
# If we spread them around, we might also want to spread around the ports
#CONFLUENT_KAFKA_RUN_DIR="/tmp/kafka$1"
CONF_KAFKA_RUN_DIR="/data/conf-kafka"

fi


if [[ -z ${CONF_KAFKA_INSTALLER_DIR} ]] ; then
    echo " "
    echo "ERROR: CONF_KAFKA_INSTALLER_DIR is not defined !"
    exit 1;
fi

if [[ -z ${CONF_KAFKA_DEPLOYMENT_DIR} ]] ; then
    echo " "
    echo "ERROR: CONF_KAFKA_DEPLOYMENT_DIR is not defined !"
    exit 1;
fi

if [[ -z ${CONF_KAFKA_NAME} ]] ; then
    echo " "
    echo "ERROR: CONF_KAFKA_NAME is not defined !"
    exit 1;
fi

if [[ -z ${CONF_KAFKA_VERSION} ]] ; then
    echo " "
    echo "ERROR: CONF_KAFKA_VERSION is not defined !"
    exit 1;
fi

if [[ -z ${CONF_KAFKA_RUN_DIR} ]] ; then
    echo " "
    echo "ERROR: CONF_KAFKA_RUN_DIR is not defined !"
    exit 1;
fi


if [ ! -f  $CONF_KAFKA_INSTALLER_DIR/$CONF_KAFKA_NAME.tar.gz ]; then
   echo "[INFO] Downloading CONFLUENT_Kafka($CONF_KAFKA_INSTALLER_DIR/$CONF_KAFKA_NAME.tar.gz) ..."
   # curl -O http://packages.confluent.io/archive/5.0/confluent-5.0.1-2.11.tar.gz
   #wget -O "$CONFLUENT_KAFKA_INSTALLER_DIR/$CONFLUENT_KAFKA_NAME.tar.gz" http://apache.claz.org/kafka/"$CONFLUENT_KAFKA_VERSION/$CONFLUENT_KAFKA_NAME.tar.gz"
   wget -O "$CONF_KAFKA_INSTALLER_DIR/$CONF_KAFKA_NAME.tar.gz" http://packages.confluent.io/archive/5.0/"$CONF_KAFKA_VERSION/$CONF_KAFKA_NAME.tar.gz"
else
   echo "[INFO] Skipping downloading CONF_Kafka: have $CONF_KAFKA_INSTALLER_DIR/$CONF_KAFKA_NAME.tar.gz"
fi

if [ ! -d "$CONF_KAFKA_DEPLOYMENT_DIR/$CONF_KAFKA_DIR_NAME" ]; then

   sudo $(dirname $0)/jdk_install.sh

   echo "[INFO] Installing Confluent Kafka ..."
   tar -zxf $CONF_KAFKA_INSTALLER_DIR/$CONF_KAFKA_NAME.tar.gz -C $CONF_KAFKA_DEPLOYMENT_DIR/
   echo "export PATH=\$PATH:$CONF_KAFKA_DEPLOYMENT_DIR/$CONF_KAFKA_NAME/bin/" >> /home/vagrant/.bashrc
   echo "export WS_KAFKA_VERSION=$CONF_KAFKA_VERSION" >> /home/vagrant/.bashrc
   chown vagrant:vagrant -R "$CONF_KAFKA_DEPLOYMENT_DIR/$CONF_KAFKA_DIR_NAME"
else
   echo "[INFO] Skipping unpacking Confluent Kafka: $CONF_KAFKA_DEPLOYMENT_DIR/$CONF_KAFKA_DIR_NAME is present"
fi

if [ ! -d $CONF_KAFKA_RUN_DIR ]; then
   echo "[INFO] Creating CONF_kafka data dir $CONF_KAFKA_RUN_DIR ..."
   sudo mkdir -p $CONF_KAFKA_RUN_DIR
   sudo chown vagrant:vagrant -R $CONF_KAFKA_RUN_DIR
fi

cd $WHERE_I_STARTED_PWD

