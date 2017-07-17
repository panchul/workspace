#
# It is more user-friendly to have clear make goals instead of rather
# messy Ansible commands over Vagrant provisioning. Hence, this Makefile.
#

DEFAULT_YARC_SET=yser{1..2}

DEFAULT_KAFKA_SET = zookeeper1 kafka_broker1 scala1

ANSIBLE_INVENTORY=.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

all: help
# You have to be more specific about the targets

help:
	@echo " This repository is a toolbox. "
	@echo " Common make targets are grouped below by their functionality. "
	@echo " "
	@echo " To create virtual machines or sets of them: "
	@echo "     make sbshell      - creates a shell sandbox virtual machine. "
	@echo "     make sbperl      - creates a Perl sandbox virtual machine. "
	@echo "     make sbcpp        - creates a basic C++ sandbox virtual machine. "
	@echo "     make sberl        - creates a basic Erlang sandbox virtual machine. "
	@echo "     make sbsc         - creates a basic Scala sandbox virtual machine. "
	@echo "     make sbyarc       - creates a yarc sandbox virtual machine. "
	@echo "     make sbjavascript - creates a sandbox virtual machine for JavaScript. "
	@echo " "
	@echo "     make kafka_up     - brings up a setup for working with Kafka:"
	@echo "                         - vm zookeeper1, single node Zookeeper          "
	@echo "                         - vm kafka_broker1, single node Kafka cluster   "
	@echo "                         - vm scala1, a generic Scala box                "
	# TODO: maybe add a C++ sandbox with Kafka client
	@echo "     make kafka_suspend  - suspends the set of Kafka vms"
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

kafka: kafka_up

kafka_up: 
	vagrant up $(DEFAULT_KAFKA_SET)

kafka_suspend: 
	vagrant suspend $(DEFAULT_KAFKA_SET)

sbyarc: prepare_folders_yarc
	vagrant up $(DEFAULT_YARC_SET)

sbcpp: prepare_folders_cpp
	vagrant up cpp1

sberl: prepare_folders_erl
	vagrant up erlang1

sbsc: prepare_folders_scala
	vagrant up scala1

sbshell: prepare_folders_shell
	vagrant up shell1

sbperl: prepare_folders_perl
	vagrant up perl1

sbjavascript:
	vagrant up javascript1

provision_cpp:
	vagrant provision cpp1

test: test_cpp
	@echo "Ran all tests"

test_cpp:
	@echo "TODO: create these tests"
	ansible-playbook --connection ssh -u vagrant -i $(ANSIBLE_INVENTORY) -v ansible/playbooks/test_cpp/test1.yml
	@echo "Ran cpp tests"

prepare_folders:  prepare_folders_yarc \
				prepare_folders_cpp \
				prepare_folders_erl \
				prepare_folders_scala \
				prepare_folders_shell \
				prepare_folders_perl

prepare_folders_yarc:
	@mkdir -p projects_sbyser1
	@mkdir -p projects_sbyser2
	@mkdir -p projects_sbyser3
	@mkdir -p projects_sbyser4
	@mkdir -p projects_sbyser5

prepare_folders_shell:
	# @mkdir -p projects_sbshell1

prepare_folders_perl:
	# @mkdir -p projects_sbperl1

prepare_folders_cpp:
	# @mkdir -p projects_sbcpp1

prepare_folders_erl:
	# @mkdir -p projects_sberl1

prepare_folders_scala:
	# @mkdir -p projects_sbsc1
