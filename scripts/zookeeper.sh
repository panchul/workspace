#!/usr/bin/env bash

ZOOKEEPER_RUN_DIR="/tmp/zookeeper$1"

# echo Starting zookeeper
#
if [ ! -d $ZOOKEEPER_RUN_DIR ]; then
    echo [INFO] Creating zookeeper data dir "$ZOOKEEPER_RUN_DIR" ...
    sudo mkdir -p $ZOOKEEPER_RUN_DIR
    sudo chown vagrant:vagrant -R $ZOOKEEPER_RUN_DIR
fi
sudo sh -c "echo $1 > $ZOOKEEPER_RUN_DIR/myid "
echo [INFO] zookeeper id is:
cat $ZOOKEEPER_RUN_DIR/myid

ZOOKEEPER_VERSION="3.4.9"
ZOOKEEPER_NAME="zookeeper-$ZOOKEEPER_VERSION"
ZOOKEEPER_INSTALLER_DIR="/vagrant/install"

if [ ! -f  $ZOOKEEPER_INSTALLER_DIR/$ZOOKEEPER_NAME.tar.gz ]; then
   echo "[INFO] Downloading Zookeeper($ZOOKEEPER_INSTALLER_DIR/$ZOOKEEPER_NAME.tar.gz) ..."
   wget -O "$ZOOKEEPER_INSTALLER_DIR/$ZOOKEEPER_NAME.tar.gz" "http://apache.claz.org/zookeeper/$ZOOKEEPER_NAME/$ZOOKEEPER_NAME.tar.gz"
else
   echo "[INFO] Skipping downloading Zookeeper: the install .tar.gz is present ($ZOOKEEPER_INSTALLER_DIR/$ZOOKEEPER_NAME.tar.gz)"
fi

if [ ! -d /home/vagrant/$ZOOKEEPER_NAME ]; then
   echo "[INFO] Installing Zookeeper ..."
   tar -zxf $ZOOKEEPER_INSTALLER_DIR/$ZOOKEEPER_NAME.tar.gz -C /home/vagrant/
   echo "export PATH=\$PATH:/home/vagrant/$ZOOKEEPER_NAME/bin/" >> /home/vagrant/.bashrc
   echo "export WS_ZOOKEEPER_VERSION=$ZOOKEEPER_VERSION" >> /home/vagrant/.bashrc
   chown vagrant:vagrant -R /home/vagrant/$ZOOKEEPER_NAME
else
   echo "[INFO] Skipping unpacking Zookeeper: /home/vagrant/$ZOOKEEPER_NAME is present"
fi

cp /vagrant/config/zoo$1.cfg /home/vagrant/zookeeper-3.4.9/conf/zoo.cfg 

# Not sure if we want to start it right away.
cd $ZOOKEEPER_RUN_DIR
sudo /home/vagrant/$ZOOKEEPER_NAME/bin/zkServer.sh start

