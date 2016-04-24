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
	@echo "     make sbcpp        - creates a basic cpp sandbox virtual machine. "
	@echo "     make sberlang     - creates a basic erlang sandbox virtual machine. "
	@echo "     make sbyarc       - creates a yarc sandbox virtual machine. "
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

sbyarc: prepare_folders_yarc
	vagrant up $(DEFAULT_YARC_SET)

sbcpp: prepare_folders_cpp
	vagrant up sbcpp1

sberlang: prepare_folders_erlang
	@echo "TODO: create this vm"
	vagrant up sberlang1

provision_cpp:
	vagrant provision sbcpp1

test: test_cpp
	@echo "Ran all tests"

test_cpp:
	@echo "TODO: create these tests"
	ansible-playbook --connection ssh -u vagrant -i $(ANSIBLE_INVENTORY) -v ansible/playbooks/test_cpp/test1.yml
	@echo "Ran cpp tests"

prepare_folders:  prepare_folders_yarc prepare_folders_cpp prepare_folders_erlang

prepare_folders_yarc:
	@mkdir -p projects_sbyser1
	@mkdir -p projects_sbyser2
	@mkdir -p projects_sbyser3
	@mkdir -p projects_sbyser4
	@mkdir -p projects_sbyser5

prepare_folders_cpp:
	@mkdir -p projects_sbcpp1

prepare_folders_erlang:
	@mkdir -p projects_sberlang1
