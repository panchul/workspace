#!/usr/bin/env bash

WHERE_I_STARTED_PWD=`pwd`

SBT_VERSION="0.13.11"
SBT_NAME="sbt-$SBT_VERSION"
SBT_INSTALLER_DIR="/vagrant/install"

if [ ! -f "$SBT_INSTALLER_DIR/$SBT_NAME.tgz" ]; then
   echo "[INFO] Downloading sbt install, $SBT_NAME.tgz"
   wget -O "$SBT_INSTALLER_DIR/$SBT_NAME.tgz" https://dl.bintray.com/sbt/native-packages/sbt/"$SBT_VERSION/$SBT_NAME.tgz"
else
   echo "[INFO] Skipping downloading, already have $SBT_INSTALLER_DIR/$SBT_NAME.tgz"
fi

if [ ! -d /home/vagrant/sbt ]; then
   echo "[INFO] Installing Sbt. Might take a while ..."
   tar -zxf $SBT_INSTALLER_DIR/$SBT_NAME.tgz -C /home/vagrant
   chown vagrant:vagrant -R /home/vagrant/sbt
   # cd sbt/bin
   # ./sbt
   echo "export PATH=\$PATH:/home/vagrant/sbt/bin/" >> /home/vagrant/.bashrc
   echo "export WS_SBT_VERSION=$SBT_VERSION" >> /home/vagrant/.bashrc
   echo "[INFO] Done installing Sbt"
else
   echo "[INFO] Sbt seem to be already installed : /home/vagrant/sbt"
fi

cd $WHERE_I_STARTED_PWD
