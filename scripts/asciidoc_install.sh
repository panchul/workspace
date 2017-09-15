#!/usr/bin/env bash

ASCIIDOC_INSTALLER_DIR=/vagrant/install
ASCIIDOC_VERSION="8.6.9"
ASCIIDOC_NAME="asciidoc-${ASCIIDOC_VERSION}"
ASCIIDOC_DEPLOYMENT_DIR="/home/vagrant"

WHERE_I_STARTED_PWD=`pwd`

if [ ! -f  "${ASCIIDOC_INSTALLER_DIR}/${ASCIIDOC_NAME}.tar.gz" ]; then
    echo wget -O "${ASCIIDOC_INSTALLER_DIR}/${ASCIIDOC_NAME}.tar.gz" "https://downloads.sourceforge.net/project/asciidoc/asciidoc/${ASCIIDOC_VERSION}/${ASCIIDOC_NAME}.tar.gz"
    wget -O "${ASCIIDOC_INSTALLER_DIR}/${ASCIIDOC_NAME}.tar.gz" "https://downloads.sourceforge.net/project/asciidoc/asciidoc/${ASCIIDOC_VERSION}/${ASCIIDOC_NAME}.tar.gz"
fi

tar xzf "$ASCIIDOC_INSTALLER_DIR/$ASCIIDOC_NAME.tar.gz" -C $ASCIIDOC_DEPLOYMENT_DIR
cd "$ASCIIDOC_DEPLOYMENT_DIR/$ASCIIDOC_NAME"
./configure
sudo make install
sudo make docs

cd $WHERE_I_STARTED_PWD
