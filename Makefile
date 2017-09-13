#
# It is more user-friendly to have clear make goals instead of rather
# messy Ansible commands over Vagrant provisioning. Hence, this Makefile.
#

DEFAULT_KAFKA_SET=zookeeper{1..3} kafka_broker{1..3}

DEFAULT_HAPROXY_SET=haproxy1 apache{1..3}

ANSIBLE_INVENTORY=.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

all: help
# You have to be more specific about the targets

help:
	@echo " For most of the functionality you can use Vagrant commands, for example:"
	@echo "     To see status          "
	@echo "         $$ vagrant status   "
	@echo "     To create vm 'gen1'    "
	@echo "         $$ vagrant up gen1  "
	@echo "     To ssh to it:          "
	@echo "         $$ vagrant ssh gen1"
	@echo " "
	@echo " Git helpers: "
	@echo "     $$ make git_status    - runs 'git status' in the sandboxes. "
	@echo " "
	@echo " HAProxy playground: "
	@echo "     $$ make haproxy_up       - creates a vms for HAProxy and Apache web servers. "
	@echo "     $$ make haproxy_suspend  - suspends the set of the vms"
	@echo "     $$ make haproxy_destroy  - deletes the set of the vms"
	@echo " "
	@echo " Kafka playground: "
	@echo "     $$ make kafka_up       - brings up a setup for working with Kafka:"
	@echo "                                - vm zookeeper1, single node Zookeeper          "
	@echo "                                - vm kafka_broker1, single node Kafka cluster   "
	@echo "                                - vm scala1, a generic Scala box                "
	@echo "     $$ make kafka_suspend  - suspends the set of Kafka vms"
	@echo "     $$ make kafka_destroy  - destroys the set of Kafka vms"
	@echo " "
	@echo " To test: "
	@echo "     $$ make test          - runs all tests. Could be long and painful. "
	@echo "     $$ make test_cpp      - runs an Ansible script to run tests "
	@echo " "
	vagrant --version
	ansible --version
	@echo " If you are reading this, your system seems to have the necessary pre-requisites "
	@echo " "

git_status:
	@ for repo in `ls projects | grep sb_` ; \
	do sh -c "echo \"Checking projects/$$repo...\" ; cd projects/$$repo ; git status -sb ; cd ../.. " ; \
	done ;
	@ git status -sb

kafka: kafka_up

kafka_up: 
	@echo Bringing up $(DEFAULT_KAFKA_SET)
	vagrant up $(DEFAULT_KAFKA_SET)

kafka_suspend: 
	@echo Bringing down $(DEFAULT_KAFKA_SET)
	vagrant suspend $(DEFAULT_KAFKA_SET)

kafka_destroy: 
	@echo Deleting $(DEFAULT_KAFKA_SET)
	vagrant destroy -f $(DEFAULT_KAFKA_SET)

haproxy_up: 
	@echo Bringing up $(DEFAULT_HAPROXY_SET)
	vagrant up $(DEFAULT_HAPROXY_SET)

haproxy_suspend: 
	@echo Bringing down $(DEFAULT_HAPROXY_SET)
	vagrant suspend $(DEFAULT_HAPROXY_SET)

haproxy_destroy: 
	@echo Deleting $(DEFAULT_HAPROXY_SET)
	vagrant destroy -f $(DEFAULT_HAPROXY_SET)

test: test_cpp
	@echo "Ran all tests"

test_cpp:
	@echo "TODO: create these tests"
	ansible-playbook --connection ssh -u vagrant -i $(ANSIBLE_INVENTORY) -v ansible/playbooks/test_cpp/test1.yml
	@echo "Ran cpp tests"
