#!/usr/bin/env bash

OPENSSL_INSTALLER_DIR=/vagrant/install
OPENSSL_VERSION="1.0.2l"
OPENSSL_NAME="openssl-${OPENSSL_VERSION}"
OPENSSL_DEPLOYMENT_DIR="/home/vagrant"

WHERE_I_STARTED_PWD=`pwd`

if [ ! -f  "${OPENSSL_INSTALLER_DIR}/${OPENSSL_NAME}.tar.gz" ]; then
    echo wget -O "${OPENSSL_INSTALLER_DIR}/${OPENSSL_NAME}.tar.gz" "https://www.openssl.org/source/${OPENSSL_NAME}.tar.gz"
    wget -O "${OPENSSL_INSTALLER_DIR}/${OPENSSL_NAME}.tar.gz" "https://www.openssl.org/source/${OPENSSL_NAME}.tar.gz"
fi

tar xzf "$OPENSSL_INSTALLER_DIR/$OPENSSL_NAME.tar.gz" -C $OPENSSL_DEPLOYMENT_DIR
cd "$OPENSSL_DEPLOYMENT_DIR/$OPENSSL_NAME"
./config
make
make install

cd $WHERE_I_STARTED_PWD

#export PATH=$PATH:${build}/autotools-bin/bin
