#!/usr/bin/env bash


WHERE_I_STARTED_PWD=`pwd`

XMLTO_INSTALLER_DIR="/vagrant/install"
XMLTO_VERSION="0.0.28"
XMLTO_NAME=xmlto-${XMLTO_VERSION}
XMLTO_DEPLOYMENT_DIR=/home/vagrant

if [ ! -f  $XMLTO_INSTALLER_DIR/$XMLTO_NAME.tar.gz ]; then
   wget -O "$XMLTO_INSTALLER_DIR/$XMLTO_NAME.tar.gz" "https://fossies.org/linux/privat/$XMLTO_NAME.tar.gz"
fi

if [ ! -d "$XMLTO_DEPLOYMENT_DIR/$XMLTO_NAME" ]; then
   mkdir -p $XMLTO_DEPLOYMENT_DIR
   tar -zxf $XMLTO_INSTALLER_DIR/$XMLTO_NAME.tar.gz -C $XMLTO_DEPLOYMENT_DIR
   echo "export WS_XMLTO_VERSION=$XMLTO_VERSION" >> /home/vagrant/.bashrc
   chown vagrant:vagrant -R "$XMLTO_DEPLOYMENT_DIR/$XMLTO_NAME"
fi

#if [ ! -f  $XMLTO_DEPLOYMENT_DIR/$XMLTO_NAME/bin/git ]; then
    echo "[INFO] Building xmlto..."
    cd "$XMLTO_DEPLOYMENT_DIR/$XMLTO_NAME"

    # See linuxfromscratch.org/blfs/view/cvs/pst/xmlto.html
    LINKS="/usr/bin/links" ./configure --prefix=/usr && make
    sudo make install
#else
#   echo "[INFO] Skipping building ZLIB: already have $ZLIB_DEPLOYMENT_DIR/$ZLIB_NAME/bin/crap"
#fi

cd $WHERE_I_STARTED_PWD






