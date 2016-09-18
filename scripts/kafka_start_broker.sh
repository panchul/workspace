#!/bin/bash

if [ $# -gt 0 ]; then
    # TODO: run the server properly.
    $HOME/kafka_2.11-0.10.0.1/bin/kafka-server-start.sh /vagrant/config/kafka_broker_server$1.properties &
else
    echo "Usage: $0 <server number>"
fi
