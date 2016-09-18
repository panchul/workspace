#!/bin/bash


if [ $# -gt 0 ]; then
    $HOME/kafka_2.11-0.10.0.1/bin/kafka-topics.sh --zookeeper zookeeper1:2181 --replication-factor 1 --partition 1 --topic $1 --create
else
    echo "Usage: kafka_create_topic.sh <topic_name>"
fi

