#!/usr/bin/env bash

echo Starting zookeeper

if [ ! -d /tmp/zookeeper ]; then
    echo creating zookeeper data dir...
    mkdir /tmp/zookeeper
fi

echo $1 > /tmp/zookeeper/myid
echo zookeeper id is:
cat /tmp/zookeeper/myid


ZOOKEEPER_VERSION="3.4.9"
ZOOKEEPER_NAME="zookeeper-$ZOOKEEPER_VERSION"
ZOOKEEPER_TARGET="/vagrant/install"

if [ ! -f  $ZOOKEEPER_TARGET/$ZOOKEEPER_NAME.tar.gz ]; then
   echo "Downloading Zookeeper($ZOOKEEPER_TARGET/$ZOOKEEPER_NAME.tar.gz) ..."
   mkdir -p $ZOOKEEPER_TARGET
   wget -O "$ZOOKEEPER_TARGET/$ZOOKEEPER_NAME.tar.gz" "http://apache.claz.org/zookeeper/$ZOOKEEPER_NAME/$ZOOKEEPER_NAME.tar.gz"
else
   echo "Skipping downloading Zookeeper: the install .tar.gz is present ($ZOOKEEPER_TARGET/$ZOOKEEPER_NAME.tar.gz)"
fi

if [ ! -d /home/vagrant/$ZOOKEEPER_NAME ]; then
   echo "Installing Zookeeper ..."
   tar -zxf $ZOOKEEPER_TARGET/$ZOOKEEPER_NAME.tar.gz -C /home/vagrant/
   echo "export PATH=\$PATH:~/$ZOOKEEPER_NAME/bin/" >> /home/vagrant/.bashrc
   chown vagrant:vagrant -R /home/vagrant/$ZOOKEEPER_NAME
else
   echo "Skipping unpacking Zookeeper: /home/vagrant/$ZOOKEEPER_NAME is present"
fi

cp /vagrant/config/zoo.cfg $HOME/zookeeper-3.4.9/conf/zoo.cfg 

$HOME/zookeeper-3.4.9/bin/zkServer.sh start

