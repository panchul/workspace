#!/usr/bin/env bash

#KAFKA_VERSION="0.8.2.2"
#KAFKA_VERSION="0.10.0.1"
CONF_KAFKA_VERSION="5.0.1"
CONF_KAFKA_DIR_NAME="confluent-$CONF_KAFKA_VERSION"
CONF_KAFKA_NAME="confluent-$CONF_KAFKA_VERSION-2.11"
CONF_KAFKA_INSTALLER_DIR="/vagrant/install"
CONF_KAFKA_DEPLOYMENT_DIR="/home/vagrant"
CONF_KAFKA_CONFIG_DIR="/vagrant/config"
# If we spread them around, we might also want to spread around the ports
#KAFKA_RUN_DIR="/tmp/kafka$1"
CONF_KAFKA_RUN_DIR="/data/conf-kafka"
