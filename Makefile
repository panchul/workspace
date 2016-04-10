#
# It is more user-friendly to have clear make goals instead of rather
# messy Ansible commands over Vagrant provisioning. Hence, this Makefile.
#

DEFAULT_YARC_SET=yser{1..2}

ANSIBLE_INVENTORY=.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

all: help
# You have to be more specific about the targets

help:
	@echo " This repository is a toolbox. "
	@echo " Common make targets are grouped below by their functionality. "
	@echo " "
	@echo " To create virtual machines or sets of them: "
	@echo "     make sb_cpp        - creates a basic cpp sandbox virtual machine. "
	@echo "     make sb_erlang     - creates a basic erlang sandbox virtual machine. "
	@echo "     make sb_yarc       - creates a yarc sandbox virtual machine. "
	@echo " "
	@echo " To provision(helps if a re-try is needed): "
	@echo "     make provision_cpp - runs an Ansible script to provision things needed. "
	@echo " "
	@echo " To test: "
	@echo "     make test          - runs all tests. Could be long and painful. "
	@echo "     make test_cpp      - runs an Ansible script to run tests "
	@echo " "
	vagrant --version
	ansible --version
	@echo " If you are reading this, your system seems to have the necessary pre-requisites "
	@echo " "

sb_yarc: prepare_folders_yarc
	vagrant up $(DEFAULT_YARC_SET)

sb_cpp: prepare_folders_cpp
	@echo "TODO: create this vm"
	vagrant up sb_cpp1

sb_erlang: prepare_folders_erlang
	@echo "TODO: create this vm"
	vagrant up sb_erlang1

provision_cpp:
	vagrant provision sb_cpp1

test: test_cpp
	@echo "Ran all tests"

test_cpp:
	@echo "TODO: create these tests"
	ansible-playbook --connection ssh -u vagrant -i $(ANSIBLE_INVENTORY) -v ansible/playbooks/test_cpp/test1.yml
	@echo "Ran cpp tests"

prepare_folders:  prepare_folders_yarc prepare_folders_cpp prepare_folders_erlang

prepare_folders_yarc:
	@mkdir -p projects_sb_yser1
	@mkdir -p projects_sb_yser2
	@mkdir -p projects_sb_yser3
	@mkdir -p projects_sb_yser4
	@mkdir -p projects_sb_yser5

prepare_folders_cpp:
	@mkdir -p projects_sb_cpp1

prepare_folders_erlang:
	@mkdir -p projects_sb_erlang1
