#!/bin/bash

TOPIC_NAME=testtopic1
BROKER_LIST="localhost:9092"
TIMEOUT=1000
KAFKA_PATH=/usr/local/confluent-5.0.1
CONSUMER_GROUP=mygroupname

$KAFKA_PATH/bin/kafka-console-consumer --group $CONSUMER_GROUP --topic $TOPIC_NAME --bootstrap-server $BROKER_LIST > /dev/null
