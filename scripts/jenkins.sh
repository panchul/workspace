#!/usr/bin/env bash

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

# This one did not work with 'sh'
sudo bash -c "echo deb https://pkg.jenkins.io/debian-stable binary/ >> /etc/apt/sources.list"

# This worked better
#sudo bash -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-get -y update
sudo apt-get -y install jenkins

