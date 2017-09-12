#!/usr/bin/env bash

#KAFKA_VERSION="0.8.2.2"
#KAFKA_VERSION="0.10.0.1"
KAFKA_VERSION="0.11.0.0"
KAFKA_NAME="kafka_2.11-$KAFKA_VERSION"
KAFKA_INSTALLER_DIR="/vagrant/install"
KAFKA_DEPLOYMENT_DIR="/home/vagrant"
KAFKA_CONFIG_DIR="/vagrant/config"
# If we spread them around, we might also want to spread around the ports
#KAFKA_RUN_DIR="/tmp/kafka$1"
KAFKA_RUN_DIR="/data/kafka"
