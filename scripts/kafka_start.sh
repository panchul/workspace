#!/bin/bash

source $(dirname $0)/kafka_env.sh

if [ $# -gt 0 ]; then

    if [[ -z ${KAFKA_DEPLOYMENT_DIR} ]] ; then
        echo " "
        echo "ERROR: KAFKA_DEPLOYMENT_DIR is not defined !"
        exit 1;
    fi

    if [[ -z ${KAFKA_NAME} ]] ; then
        echo " "
        echo "ERROR: KAFKA_NAME is not defined !"
        exit 1;
    fi

    if [[ -z ${KAFKA_RUN_DIR} ]] ; then
        echo " "
        echo "ERROR: KAFKA_RUN_DIR is not defined !"
        exit 1;
    fi

    if [[ -z ${KAFKA_CONFIG_DIR} ]] ; then
        echo " "
        echo "ERROR: KAFKA_CONFIG_DIR is not defined !"
        exit 1;
    fi

    if [ ! -d "$KAFKA_DEPLOYMENT_DIR/$KAFKA_NAME" ]; then
        echo "[WARN] No Kafka found. Installing Kafka ..."
        $(dirname $0)/kafka_install.sh
    fi
    
    if [ ! -f "$KAFKA_CONFIG_DIR/kafka_broker_server$1.properties" ]; then
        echo "[WARN] There is no config file at $KAFKA_CONFIG_DIR/kafka_broker_server$1.properties ..."
        exit 1
    fi
    
    # Let's just explicitly pass it in.
    sudo sh -c "$KAFKA_DEPLOYMENT_DIR/$KAFKA_NAME/bin/kafka-server-start.sh -daemon $KAFKA_CONFIG_DIR/kafka_broker_server$1.properties "
    
else
    echo "Usage: $0 <server number>"
    exit 1
fi
