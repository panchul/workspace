#!/usr/bin/env bash

# https://docs.opencv.org/master/d7/d9f/tutorial_linux_install.html
# https://www.learnopencv.com/install-opencv3-on-ubuntu/


sudo apt-get update
sudo apt-get -y install build-essential
sudo apt-get -y install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get -y install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev

# can't find it
# sudo apt-get -y install libjasper-dev

sudo apt-get -y install libdc1394-22-dev

