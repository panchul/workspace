#!/usr/bin/env bash

python --version

if [[ $? -eq 0 ]] ; then 
    # Already installed
    echo "Detected that python has already been installed"
    return 0;
else
    echo "Detected that python has NOT already been installed"
fi


sudo apt-get -y install python

