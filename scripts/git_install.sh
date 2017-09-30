#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# simple, but external way:
#
# sudo apt-get -y install git 
#


GIT_INSTALLER_DIR="/vagrant/install"
GIT_VERSION="2.9.5"
GIT_NAME="git-${GIT_VERSION}"
GIT_DEPLOYMENT_DIR="/home/vagrant"

WHERE_I_STARTED_PWD=`pwd`

if [ ! -f  "$GIT_INSTALLER_DIR/$GIT_NAME.tar.gz" ]; then
   echo "[INFO] Downloading Git($GIT_INSTALLER_DIR/$GIT_NAME.tar.gz) ..."
   wget -O "${GIT_INSTALLER_DIR}/${GIT_NAME}.tar.gz" "https://www.kernel.org/pub/software/scm/git/${GIT_NAME}.tar.gz"
else
   echo "[INFO] Skipping downloading Git: have $GIT_INSTALLER_DIR/$GIT_NAME.tar.gz"
fi

if [ ! -d "$GIT_DEPLOYMENT_DIR/$GIT_NAME" ]; then
   echo "[INFO] Installing Git ..."
   mkdir -p "$GIT_DEPLOYMENT_DIR"
   echo tar -xzf "$GIT_INSTALLER_DIR/$GIT_NAME.tar.gz" -C $GIT_DEPLOYMENT_DIR
   tar -xzf "$GIT_INSTALLER_DIR/$GIT_NAME.tar.gz" -C $GIT_DEPLOYMENT_DIR
   export PATH=$PATH:$GIT_DEPLOYMENT_DIR/$GIT_NAME/bin/
   echo "export PATH=\$PATH:$GIT_DEPLOYMENT_DIR/$GIT_NAME/bin/" >> /home/vagrant/.bashrc
   echo "export WS_GIT_VERSION=$GIT_VERSION" >> /home/vagrant/.bashrc
   chown vagrant:vagrant -R "$GIT_DEPLOYMENT_DIR/$GIT_NAME"
else
   echo "[INFO] Skipping unpacking Git: $GIT_DEPLOYMENT_DIR/$GIT_NAME is present"
fi


if [ ! -f  $GIT_DEPLOYMENT_DIR/$GIT_NAME/bin/git ]; then

    echo "[INFO] Building git..."

    # pre-requisite for git
    cd $WHERE_I_STARTED_PWD
    echo building pre-req $(dirname $0)/zlib_install.sh
    source $(dirname $0)/zlib_install.sh

    # pre-requisite for autoconf tools
    cd $WHERE_I_STARTED_PWD
    echo building pre-req $(dirname $0)/m4_install.sh
    source $(dirname $0)/m4_install.sh
    
    # pre-requisite
    cd $WHERE_I_STARTED_PWD
    echo building pre-req $(dirname $0)/autotools_install.sh
    source $(dirname $0)/autotools_install.sh

    # pre-requisite
    cd $WHERE_I_STARTED_PWD
    echo building pre-req $(dirname $0)/asciidoc_install.sh
    source $(dirname $0)/asciidoc_install.sh
    
    # pre-requisite
    cd $WHERE_I_STARTED_PWD
    echo building pre-req $(dirname $0)/xmlto_install.sh
    source $(dirname $0)/xmlto_install.sh

    cd "$GIT_DEPLOYMENT_DIR/$GIT_NAME"
    make configure
    ./configure --prefix=/usr
    make all 
    # make doc
    sudo make install
    #sudo make  install-doc install-html
    export PATH=$PATH:$GIT_DEPLOYMENT_DIR/$GIT_NAME/bin
    echo "export PATH=\$PATH:$GIT_DEPLOYMENT_DIR/$GIT_NAME/bin" >> ~/.bashrc
else
   echo "[INFO] Skipping building Git: already have $GIT_DEPLOYMENT_DIR/$GIT_NAME/bin/git"
fi


# TODO: install more mergetools, gui, etc.
