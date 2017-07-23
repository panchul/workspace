#!/usr/bin/env bash

# sync the list

sudo apt-get -y update

# sudo apt-get -y install docker

sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

#-----------------------------

# presuming amd64
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#armhf:
#$ sudo add-apt-repository \
#   "deb [arch=armhf] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"

#s390x:
#$ sudo add-apt-repository \
#   "deb [arch=s390x] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"

#-----------------------------

# Do not remove this, it updates the packages info
sudo apt-get -y update

# The Docker package
sudo apt-get -y install docker-ce

# Snapshot of what we've got
apt-cache madison docker-ce


# Run this to see that it all works if you want.
# sudo docker run hello-world


#--------------------------------
# docker-compose

# easiest way to install, using pip
#sudo apt-get -y pip
sudo /home/vagrant/tmp_provisioning/pip_install.sh

sudo pip install docker-compose

#---------------------------------
