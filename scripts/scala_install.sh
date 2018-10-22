#!/usr/bin/env bash

scala -version

if [[ $? -eq 0 ]] ; then 
    # Already installed
    echo "Detected that scala has already been installed"
    return 0;
else
    echo "Detected that scala has NOT already been installed"
fi


# sync the list
# sudo apt-get -y update
# sudo apt-get -y install scala

SCALA_VERSION="2.11.8"
SCALA_NAME="scala-$SCALA_VERSION"
SCALA_INSTALLER_DIR="/vagrant/install"

if [ ! -f "$SCALA_INSTALLER_DIR/$SCALA_NAME.tgz" ]; then
   echo "[INFO] Downloading scala install, $SCALA_NAME.tgz"
   wget -O "$SCALA_INSTALLER_DIR/$SCALA_NAME.tgz" "http://downloads.lightbend.com/scala/$SCALA_VERSION/$SCALA_NAME.tgz"
else
   echo "[INFO] Skipping downloading, already have $SCALA_INSTALLER_DIR/$SCALA_NAME.tgz"
fi

if [ ! -d /home/vagrant/$SCALA_NAME ]; then
   echo "[INFO] Installing Sbt. Might take a while ..."
   tar -zxf $SCALA_INSTALLER_DIR/$SCALA_NAME.tgz -C /home/vagrant
   chown vagrant:vagrant -R /home/vagrant/$SCALA_NAME
   echo "export SCALA_HOME=/home/vagrant/$SCALA_NAME" >> /home/vagrant/.bashrc
   echo "export PATH=\$PATH:\$SCALA_HOME/bin/" >> /home/vagrant/.bashrc
   echo "export WS_SCALA_VERSION=$SCALA_VERSION" >> /home/vagrant/.bashrc
   echo "[INFO] Done installing Scala"
else
   echo "[INFO] Scala seem to be already installed : /home/vagrant/$SCALA_NAME"
fi

