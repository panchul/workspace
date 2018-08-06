#!/usr/bin/env bash

# TODO: Replace the following with using specific package, from /install dir.
# sync the list

# I do more via Ansible
#sudo apt-get -y update
#sudo apt-get -y install erlang

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get -y update
# Install the Erlang/OTP platform and all of its applications: 
sudo apt-get -y install esl-erlang
#Install Elixir: 
sudo apt-get -y install elixir



