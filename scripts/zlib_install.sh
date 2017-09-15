#!/usr/bin/env bash

# simple, but external way:
#
#sudo apt-get -y install zlib1g-dev 
#

WHERE_I_STARTED_PWD=`pwd`

ZLIB_INSTALLER_DIR="/vagrant/install"
ZLIB_VERSION="1.2.11"
ZLIB_NAME=zlib-${ZLIB_VERSION}
ZLIB_DEPLOYMENT_DIR=/home/vagrant

if [ ! -f  $ZLIB_INSTALLER_DIR/$ZLIB_NAME.tar.gz ]; then
   echo "[INFO] Downloading ZLib($ZLIB_INSTALLER_DIR/${ZLIB_NAME}.tar.gz) ..."
   wget -O "$ZLIB_INSTALLER_DIR/$ZLIB_NAME.tar.gz" "https://zlib.net/${ZLIB_NAME}.tar.gz"
else
   echo "[INFO] Skipping downloading ZLib: have $ZLIB_INSTALLER_DIR/$ZLIB_NAME.tar.gz"
fi

if [ ! -d "$ZLIB_DEPLOYMENT_DIR/$ZLIB_NAME" ]; then
   echo "[INFO] Installing ZLib ..."
   mkdir -p $ZLIB_DEPLOYMENT_DIR
   tar -zxf $ZLIB_INSTALLER_DIR/$ZLIB_NAME.tar.gz -C $ZLIB_DEPLOYMENT_DIR
   echo "export PATH=\$PATH:$ZLIB_DEPLOYMENT_DIR/$ZLIB_NAME/bin/" >> /home/vagrant/.bashrc
   echo "export WS_ZLIB_VERSION=$ZLIB_VERSION" >> /home/vagrant/.bashrc
   chown vagrant:vagrant -R "$ZLIB_DEPLOYMENT_DIR/$ZLIB_NAME"
else
   echo "[INFO] Skipping unpacking ZLib: $ZLIB_DEPLOYMENT_DIR/$ZLIB_NAME is present"
fi


#if [ ! -f  $ZLIB_DEPLOYMENT_DIR/$ZLIB_NAME/bin/git ]; then
    echo "[INFO] Building zlib..."
    cd "$ZLIB_DEPLOYMENT_DIR/$ZLIB_NAME"
    ./configure
    sudo make install
#else
#   echo "[INFO] Skipping building ZLIB: already have $ZLIB_DEPLOYMENT_DIR/$ZLIB_NAME/bin/crap"
#fi

cd $WHERE_I_STARTED_PWD
