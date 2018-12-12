#!/bin/bash

source $(dirname $0)/conf_kafka_env.sh

if [ $# -gt 0 ]; then

    if [[ -z ${CONF_KAFKA_DEPLOYMENT_DIR} ]] ; then
        echo " "
        echo "ERROR: CONF_KAFKA_DEPLOYMENT_DIR is not defined !"
        exit 1;
    fi

    if [[ -z ${CONF_KAFKA_NAME} ]] ; then
        echo " "
        echo "ERROR: CONF_KAFKA_NAME is not defined !"
        exit 1;
    fi

    if [[ -z ${CONF_KAFKA_DIR_NAME} ]] ; then
        echo " "
        echo "ERROR: CONF_KAFKA_DIR_NAME is not defined !"
        exit 1;
    fi

    if [[ -z ${CONF_KAFKA_RUN_DIR} ]] ; then
        echo " "
        echo "ERROR: CONF_KAFKA_RUN_DIR is not defined !"
        exit 1;
    fi

    if [[ -z ${CONF_KAFKA_CONFIG_DIR} ]] ; then
        echo " "
        echo "ERROR: CONF_KAFKA_CONFIG_DIR is not defined !"
        exit 1;
    fi

    if [ ! -d "$CONF_KAFKA_DEPLOYMENT_DIR/$CONF_KAFKA_DIR_NAME" ]; then
        echo "[WARN] No Conf Kafka found. Installing Conf Kafka ..."
        $(dirname $0)/conf_kafka_install.sh
    fi
    
    if [ ! -f "$CONF_KAFKA_CONFIG_DIR/conf_kafka_broker_server$1.properties" ]; then
        echo "[WARN] There is no config file at $CONF_KAFKA_CONFIG_DIR/conf_kafka_broker_server$1.properties ..."
        exit 1
    fi
    
    # Let's just explicitly pass it in.
    sudo sh -c "$CONF_KAFKA_DEPLOYMENT_DIR/$CONF_KAFKA_DIR_NAME/bin/kafka-server-start -daemon $CONF_KAFKA_CONFIG_DIR/conf_kafka_broker_server$1.properties "
    
else
    echo "Usage: $0 <server number>"
    exit 1
fi
