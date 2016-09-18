#!/usr/bin/env bash

# sync the list
#sudo apt-get -y update

# Takes too long
## actual upgrade
#sudo apt-get -y upgrade
#

echo "set esckeys" >> ~/.vimrc
echo "set tabstop=4" >> ~/.vimrc
echo "set number" >> ~/.vimrc

echo "set esckeys" >> /home/vagrant/.vimrc
echo "set tabstop=4" >> /home/vagrant/.vimrc
echo "set number" >> /home/vagrant/.vimrc

sudo apt-get -y install ubuntu-restricted-extras
