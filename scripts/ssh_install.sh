#!/usr/bin/env bash

sudo apt update
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo ufw allow ssh


