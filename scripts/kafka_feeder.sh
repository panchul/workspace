#!/bin/bash

TOPIC_NAME=testtopic1
BROKER_LIST="localhost:9092"
TIMEOUT=1000
KAFKA_PATH=~/confluent-5.0.1

COUNTER_LIMIT=10
SCENARIO=0
MESSAGE_SIZE=1000
NUMBER_OF_MESSAGES=100000


function generate_workload() {
# a.out - simple .cpp script to generate stdout fast

	./a.out $SCENARIO $MESSAGE_SIZE $NUMBER_OF_MESSAGES $*
}

function generate_workload1() {
     NOW=$(date +%s)
     local DIFF=$(($NOW - $START))
     local MINS=$(($DIFF / 60 % 60))
     local SECS=$(($DIFF % 60))
     local HOURS=$(($DIFF / 3600 % 24))
     local DAYS=$(($DIFF / 86400))
     printf "%4d from start: %3d Days, %02d:%02d:%02d\n" $* $DAYS $HOURS $MINS $SECS
     printf "%4d from start: %3d Days, %02d:%02d:%02d\n" $* $DAYS $HOURS $MINS $SECS
     printf "%4d from start: %3d Days, %02d:%02d:%02d\n" $* $DAYS $HOURS $MINS $SECS
     printf "%4d from start: %3d Days, %02d:%02d:%02d\n" $* $DAYS $HOURS $MINS $SECS
     printf "%4d from start: %3d Days, %02d:%02d:%02d\n" $* $DAYS $HOURS $MINS $SECS
}

function feed_to_kafka() {

     generate_workload $* $TOPIC_NAME | $KAFKA_PATH/bin/kafka-console-producer --topic $TOPIC_NAME --broker-list $BROKER_LIST --timeout $TIMEOUT 1>/dev/null
}

function stopwatch() {
  local START=$(date +%s)
  if [ -z "$1" ]; then
    echo "Starting..."
  else
    echo $@
  fi

  COUNTER=0

  while [  $COUNTER -lt $COUNTER_LIMIT ]; do
  #while true; do
     NOW=$(date +%s)
     local DIFF=$(($NOW - $START))
     local MINS=$(($DIFF / 60 % 60))
     local SECS=$(($DIFF % 60))
     local HOURS=$(($DIFF / 3600 % 24))
     local DAYS=$(($DIFF / 86400))
     #printf "\r%3d Days, %02d:%02d:%02d" $DAYS $HOURS $MINS $SECS
 
     feed_to_kafka $COUNTER
     local DONE=$(date +%s)
     local DIFF_DONE=$(($DONE - $NOW))
     local DIFF_DONE_TOTAL=$(($DONE - $START))
     let COUNTER=COUNTER+1
     local BYTES_PER_SEC=$(( ($COUNTER * $MESSAGE_SIZE * 60 ) / $DIFF_DONE_TOTAL ))

     echo "Iteration $COUNTER took $DIFF_DONE sec. Total time: $DIFF_DONE_TOTAL seconds, Bytes per second: $BYTES_PER_SEC"
  done
}

echo "Scenario: $SCENARIO, Message size: $MESSAGE_SIZE, Messages per iteration: $NUMBER_OF_MESSAGES, Iterations: $COUNTER_LIMIT, Timeout $TIMEOUT"

stopwatch "Started the feeder. Click Ctrl-C to break. Or wait until it is done."

echo Done.

