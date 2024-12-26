#
# It is more user-friendly to have clear make goals instead of rather
# messy Ansible commands over Vagrant provisioning. Hence, this Makefile.
#

DEFAULT_KAFKA_SET=zookeeper{1..2} kafka_broker{1..2}
DEFAULT_HAPROXY_SET=haproxy1 apache{1..3}
ANSIBLE_INVENTORY=.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

# all: help
.DEFAULT_GOAL := help 

help: # Show this help
	@echo " For most of the functionality you can use Vagrant commands, for example:"
	@echo "     To see status          "
	@echo "         $$ vagrant status   "
	@echo "     To create vm 'gen1'    "
	@echo "         $$ vagrant up gen1  "
	@echo "     To ssh to it:          "
	@echo "         $$ vagrant ssh gen1"
	@echo " "
	@echo " Git helpers: "
	@echo "     $$ make git_status    - runs 'git status' in the sandboxes and private repositories. "
	@echo "                             Optional list, containing one repository per line, in file"
	@echo "                             private_repo_list.txt should be placed in private/ folder"
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
	@echo "Targets for make(there are more, hidden. Look inside of the makefile):"
	@egrep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo " "

# Add vm status, kubernetes and docker status, etc. if needed 
status_all: git_status

# A shorthand to be similar to `git status`
status: git_status

git_status: # Status of repositories (public and private, from `private_repo_list.txt`)
	@echo "Checking sandboxes..."
	@ for repo in `ls projects | grep sb_` ; \
	   do sh -c "echo \"Checking \\\"projects/$$repo\\\"...\" ; cd \"projects/$$repo\" ; git fetch ; git status -sb ; cd ../.. " ; \
	done ;
	@echo "Checking private_repo_list items ..."
	@ oldpath=`pwd`
	@ if [ -e private/private_repo_list.txt ] ; then \
	    for repo in `cat private/private_repo_list.txt` ; \
	      do sh -c "echo \"Checking PRIVATE \\\"$$repo\\\"...\" ; cd \"$$repo\" ; git fetch ; git status -sb ; cd $$oldpath " ; \
	      done ; \
	else \
	  @echo "HINT: You might want to run 'ls -l1 projects > private/private_repo_list.txt' to create private repo list." ; \
	fi
	@echo "Checking workspace repo itself ..."
	@ git status -sb

kafka: kafka_up

kafka_up: # Instantiating a Kafka cluster
	@echo Bringing up $(DEFAULT_KAFKA_SET)
	vagrant up $(DEFAULT_KAFKA_SET)

kafka_suspend: 
	@echo Bringing down $(DEFAULT_KAFKA_SET)
	vagrant suspend $(DEFAULT_KAFKA_SET)

kafka_destroy: 
	@echo Deleting $(DEFAULT_KAFKA_SET)
	vagrant destroy -f $(DEFAULT_KAFKA_SET)

haproxy_up:  # Instantiating HAProxy
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
