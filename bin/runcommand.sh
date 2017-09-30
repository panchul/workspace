#!/usr/bin/env bash

if [ $# -gt 0 ]; then

    # might also need  "--connection ssh -u vagrant"
    ansible -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory all -a "$1"

else
    echo "Usage: $0 <command to run on all machines>"
    echo "try:    $0 hostname"
    echo "    or  $0 \"vmstat -a\""
    exit 1
fi
