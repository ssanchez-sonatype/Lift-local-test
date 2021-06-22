#!/usr/bin/env bash
dir=$1
commit=$2
cmd=$3 

function version() {
    echo 1
}

function applicable() {
    echo "true"
}

function run() {
    echo "[{ \"type\": \"Hello Amy\", \
            \"message\": \"Lift is analyzing commit $commit\", \
            \"file\": \"file.txt\", \
            \"line\": 0, \
            \"details_url\": \"https://example.com/#example\" \
          }, { \"type\": \"Hello Amy\", \
            \"message\": \"Lift is analyzing commit $commit and found a line\", \
            \"file\": \"file.txt\", \
            \"line\": 1, \
            \"details_url\": \"https://example.com/#example\" \
          }, { \"type\": \"Hello Amy\", \
            \"message\": \"Lift is analyzing commit $commit and found another line\", \
            \"file\": \"file.txt\", \
            \"line\": 2, \
            \"details_url\": \"https://example.com/#example2\" \
          } ]"
}

if [[ "$cmd" = "run" ]] ; then 
    run 
fi 
if [[ "$cmd" = "applicable" ]] ; then 
    applicable 
fi 
if [[ "$cmd" = "version" ]] ; then 
    version 
fi
