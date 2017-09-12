#!/bin/bash

# specific to the kafka sandbox vm

kafka-topics.sh --zookeeper zookeeper1.vm:2181,zookeeper2.vm:2181 --list
