#!/usr/bin/env bash

# gnu m4

M4_INSTALLER_DIR="/vagrant/install"
M4_VERSION=1.4.17
M4_NAME="m4-${M4_VERSION}"
M4_DEPLOYMENT_DIR="/home/vagrant"

WHERE_I_STARTED_PWD=`pwd`

if [ ! -f  "$M4_INSTALLER_DIR/$M4_NAME.tar.gz" ]; then
   echo "[INFO] Downloading M4($M4_INSTALLER_DIR/$M4_NAME.tar.gz) ..."
   wget -O "${M4_INSTALLER_DIR}/${M4_NAME}.tar.gz" "http://ftp.gnu.org/gnu/m4/${M4_NAME}.tar.gz"
else
   echo "[INFO] Skipping downloading M4: have $M4_INSTALLER_DIR/$M4_NAME.tar.gz"
fi

if [ ! -d "$M4_DEPLOYMENT_DIR/$M4_NAME" ]; then
   echo "[INFO] Installing M4 ..."
   mkdir -p "$M4_DEPLOYMENT_DIR"
   echo tar -xzf "${M4_INSTALLER_DIR}/${M4_NAME}.tar.gz" -C $M4_DEPLOYMENT_DIR
   tar -xzf "${M4_INSTALLER_DIR}/${M4_NAME}.tar.gz" -C $M4_DEPLOYMENT_DIR
   export PATH=$PATH:$M4_DEPLOYMENT_DIR/$M4_NAME/bin/
   echo "export PATH=\$PATH:$M4_DEPLOYMENT_DIR/$M4_NAME/bin/" >> /home/vagrant/.bashrc
   echo "export WS_M4_VERSION=$M4_VERSION" >> /home/vagrant/.bashrc
   chown vagrant:vagrant -R "$M4_DEPLOYMENT_DIR/$M4_NAME"
else
   echo "[INFO] Skipping unpacking M4: $M4_DEPLOYMENT_DIR/$M4_NAME is present"
fi

cd $M4_DEPLOYMENT_DIR/$M4_NAME
./configure
# maybe
# ./configure --prefix=$M4_DEPLOYMENT_DIR/autotools-bin
make
make install
export PATH=$PATH:${M4_DEPLOYMENT_DIR}/autotools-bin/bin:/usr/local/bin
echo "export PATH=\$PATH:$M4_DEPLOYMENT_DIR/$M4_NAME/bin:/usr/local/bin" >> /home/vagrant/.bashrc


cd $WHERE_I_STARTED_PWD

# sudo apt-get install m4
