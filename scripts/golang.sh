#!/usr/bin/env bash

# sync the list
# sudo apt-get -y update
# sudo apt-get -y install golang

GOLANG_VERSION="1.7.3"
GOLANG_NAME="go$GOLANG_VERSION.linux-amd64"
GOLANG_INSTALLER_DIR="/vagrant/install"

# Fix it later
GOLANG_GOPATH="/projects/sb_golang/hello"

if [ ! -f "$GOLANG_INSTALLER_DIR/$GOLANG_NAME.tar.gz" ]; then
   echo "[INFO] Downloading golang install, $GOLANG_NAME.tar.gz ..."
   wget -O "$GOLANG_INSTALLER_DIR/$GOLANG_NAME.tar.gz" "https://storage.googleapis.com/golang/$GOLANG_NAME.tar.gz"
   echo "[INFO] Downloaded golang install, $GOLANG_NAME.tar.gz"
else
   echo "[INFO] Skipping downloading, already have $GOLANG_INSTALLER_DIR/$GOLANG_NAME.tar.gz"
fi

if [ ! -d /usr/local/go ]; then
   echo "[INFO] Installing Golang..."
   tar -C /usr/local -zxf $GOLANG_INSTALLER_DIR/$GOLANG_NAME.tar.gz
   chown vagrant:vagrant -R /usr/local/go
   echo "export GOROOT=/usr/local/go" >> /home/vagrant/.bashrc
   echo "export PATH=\$PATH:\$GOROOT/bin" >> /home/vagrant/.bashrc
   # Skip it for now. Clone the packages manually
   # mkdir -p "$GOLANG_GOPATH/src/github.com/vagrant"
   chown vagrant:vagrant -R $GOLANG_GOPATH
   echo "export GOPATH=$GOROOT:$GOLANG_GOPATH" >> /home/vagrant/.bashrc
   echo "[INFO] Done installing Golang"
else
   echo "[INFO] Golang seem to be already installed : /usr/local/go"
fi

