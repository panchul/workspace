#!/usr/bin/env bash

sudo apt-get purge docker-ce

# Images, containers, volumes, or customized configuration files on your host are not automatically
# removed. To delete all images, containers, and volumes:
#
# $ sudo rm -rf /var/lib/docker
#

# TODO: uninstall pip, zookeeper, etc. if no longer needed.