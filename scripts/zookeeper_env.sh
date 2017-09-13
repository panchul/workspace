#!/usr/bin/env bash

#ZOOKEEPER_VERSION="3.4.9"
ZOOKEEPER_VERSION="3.4.10"
ZOOKEEPER_NAME="zookeeper-$ZOOKEEPER_VERSION"
ZOOKEEPER_INSTALLER_DIR="/vagrant/install"
ZOOKEEPER_DEPLOYMENT_DIR="/home/vagrant"
ZOOKEEPER_CONFIG_DIR="/vagrant/config"
# If we spread them around, we might also want to spread around the ports
#ZOOKEEPER_RUN_DIR="/tmp/zookeeper$1"
ZOOKEEPER_RUN_DIR="/data/zookeeper"

