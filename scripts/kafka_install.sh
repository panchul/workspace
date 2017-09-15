#!/usr/bin/env bash

WHERE_I_STARTED_PWD=`pwd`

source $(dirname $0)/kafka_env.sh

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
