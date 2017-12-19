#!/usr/bin/env bash

#
# Appends incremental line numbers.
#
#  applines.sh <filename/string> [<counter_start/int>
#

if [[ -n "$2" ]] ; then
  MYCOUNTER=$(($2))
else
  MYCOUNTER=0
fi

cat $1 | \
    while IFS='' read -r line || [[ -n "$line" ]]; do 
        if [[ -n "$line" ]] ; then
            echo $MYCOUNTER $line
            MYCOUNTER=$(($MYCOUNTER+1))
        fi
    done 

