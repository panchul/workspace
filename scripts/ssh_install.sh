#!/usr/bin/env bash

sudo apt update
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo ufw allow ssh

echo "run ssh-keygen and ssh-copy-id (at the machine you want to connect from) to skip entering password"
echo "   $ ssh-keygen"
echo "Save the key to id_rsa_mykey. Then"
echo "   $ ssh-copy-id -i ~/.ssh/id_rsa_mykey myusername@myhost "
echo "you can also connect as:"
echo "   $ ssh -i ~/.ssh/id_rs_mykey myusername@myhost"
echo "And you might need to create an identity in ~/.ssh/config:"
echo "   Host machinea"
echo "   Hostname myhost"
echo "   IdentityFile ~/.ssh/id_rsa_mykey"
echo "   User myusername"
