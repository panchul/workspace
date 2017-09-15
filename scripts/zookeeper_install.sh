#!/usr/bin/env bash

WHERE_I_STARTED_PWD=`pwd`

source $(dirname $0)/zookeeper_env.sh

if [[ -z ${ZOOKEEPER_INSTALLER_DIR} ]] ; then
    echo " "
    echo "ERROR: ZOOKEEPER_INSTALLER_DIR is not defined !"
    exit 1;
fi

if [[ -z ${ZOOKEEPER_DEPLOYMENT_DIR} ]] ; then
    echo " "
    echo "ERROR: ZOOKEEPER_DEPLOYMENT_DIR is not defined !"
    exit 1;
fi

if [[ -z ${ZOOKEEPER_NAME} ]] ; then
    echo " "
    echo "ERROR: ZOOKEEPER_NAME is not defined !"
    exit 1;
fi

if [[ -z ${ZOOKEEPER_VERSION} ]] ; then
    echo " "
    echo "ERROR: ZOOKEEPER_VERSION is not defined !"
    exit 1;
fi

if [[ -z ${ZOOKEEPER_RUN_DIR} ]] ; then
    echo " "
    echo "ERROR: ZOOKEEPER_RUN_DIR is not defined !"
    exit 1;
fi


if [ ! -f  $ZOOKEEPER_INSTALLER_DIR/$ZOOKEEPER_NAME.tar.gz ]; then
   echo "[INFO] Downloading Zookeeper($ZOOKEEPER_INSTALLER_DIR/$ZOOKEEPER_NAME.tar.gz) ..."
   wget -O "$ZOOKEEPER_INSTALLER_DIR/$ZOOKEEPER_NAME.tar.gz" "http://apache.claz.org/zookeeper/$ZOOKEEPER_NAME/$ZOOKEEPER_NAME.tar.gz"
else
   echo "[INFO] Skipping downloading Zookeeper: the install .tar.gz is present ($ZOOKEEPER_INSTALLER_DIR/$ZOOKEEPER_NAME.tar.gz)"
fi

if [ ! -d "$ZOOKEEPER_DEPLOYMENT_DIR/$ZOOKEEPER_NAME" ]; then
   echo "[INFO] Installing Zookeeper ..."
   tar -zxf $ZOOKEEPER_INSTALLER_DIR/$ZOOKEEPER_NAME.tar.gz -C "$ZOOKEEPER_DEPLOYMENT_DIR"
   echo "export PATH=\$PATH:$ZOOKEEPER_DEPLOYMENT_DIR/$ZOOKEEPER_NAME/bin/" >> /home/vagrant/.bashrc
   echo "export WS_ZOOKEEPER_VERSION=$ZOOKEEPER_VERSION" >> /home/vagrant/.bashrc
   chown vagrant:vagrant -R "$ZOOKEEPER_DEPLOYMENT_DIR/$ZOOKEEPER_NAME"
else
   echo "[INFO] Skipping unpacking Zookeeper: $ZOOKEEPER_DEPLOYMENT_DIR/$ZOOKEEPER_NAME is present"
fi

if [ ! -d $ZOOKEEPER_RUN_DIR ]; then
   echo "[INFO] Creating zookeeper data dir $ZOOKEEPER_RUN_DIR ..."
   sudo mkdir -p $ZOOKEEPER_RUN_DIR
   sudo chown vagrant:vagrant -R $ZOOKEEPER_RUN_DIR
fi

cd $WHERE_I_STARTED_PWD
