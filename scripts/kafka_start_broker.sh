#!/bin/bash

# specific to the kafka sandbox vm

if [ $# -gt 0 ]; then
    kafka-server-start.sh /vagrant/config/kafka_broker_server$1.properties &
else
    echo "Usage: $0 <server number>"
    exit 1
fi
