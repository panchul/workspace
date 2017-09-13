#!/bin/bash

# specific to the kafka sandbox vm

if [ $# -gt 0 ]; then
#    kafka-topics.sh --zookeeper zookeeper1:2181 --replication-factor 1 --partition 1 --topic $1 --create
    kafka-topics.sh --zookeeper zookeeper1.vm:2181,zookeeper2.vm:2181 --replication-factor 2 --partitions 2 --topic $1 --create
else
    echo "Usage: kafka_create_topic.sh <topic_name>"
fi

