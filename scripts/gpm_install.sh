#!/usr/bin/env bash

WHERE_I_STARTED_PWD=`pwd`

cd /home/vagrant/tmp_provisioning
git clone https://github.com/pote/gpm.git && cd gpm
#git checkout v1.4.0 # You can ignore this part if you want to install HEAD.
./configure
make install


cd $WHERE_I_STARTED_PWD