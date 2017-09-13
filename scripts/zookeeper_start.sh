#!/usr/bin/env bash

source $(dirname $0)/zookeeper_env.sh

if [ $# -gt 0 ]; then

    if [[ -z ${ZOOKEEPER_DEPLOYMENT_DIR} ]] ; then
        echo " "
        echo "ERROR: ZOOKEEPER_DEPLOYMENT_DIR is not defined !"
        exit 1;
    fi

    if [[ -z ${ZOOKEEPER_NAME} ]] ; then
        echo " "
        echo "ERROR: ZOOKEEPER_NAME is not defined !"
        exit 1;
    fi

    if [[ -z ${ZOOKEEPER_RUN_DIR} ]] ; then
        echo " "
        echo "ERROR: ZOOKEEPER_RUN_DIR is not defined !"
        exit 1;
    fi

    if [[ -z ${ZOOKEEPER_CONFIG_DIR} ]] ; then
        echo " "
        echo "ERROR: ZOOKEEPER_CONFIG_DIR is not defined !"
        exit 1;
    fi

    if [ ! -d "$ZOOKEEPER_DEPLOYMENT_DIR/$ZOOKEEPER_NAME" ]; then
        echo "[WARN] No Zookeeper found. Installing Zookeeper ..."
        $(dirname $0)/zookeeper_install.sh
    fi

    if [ ! -f "$ZOOKEEPER_CONFIG_DIR/zoo$1.cfg" ]; then
        echo "[ERROR] There is no config file at $ZOOKEEPER_CONFIG_DIR/zoo$1.cfg ..."
        exit 1
    fi
    
    sudo sh -c "echo $1 > $ZOOKEEPER_RUN_DIR/myid "
    echo [INFO] zookeeper id is:
    cat $ZOOKEEPER_RUN_DIR/myid    

    # Just in case let's make it the default 
    cp "$ZOOKEEPER_CONFIG_DIR/zoo$1.cfg" "$ZOOKEEPER_DEPLOYMENT_DIR/$ZOOKEEPER_NAME/conf/zoo.cfg" 
    cd "$ZOOKEEPER_RUN_DIR"
    sudo sh -c "$ZOOKEEPER_DEPLOYMENT_DIR/$ZOOKEEPER_NAME/bin/zkServer.sh start $ZOOKEEPER_CONFIG_DIR/zoo$1.cfg" 
    
else
    echo "Usage: $0 <server number>"
    exit 1
fi

