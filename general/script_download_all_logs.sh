#!/bin/bash
## created to dowload all log files
FROM=$1
TO=$2
while [ $FROM -le $TO ]
do
    echo "removing wcc_srv$fFROM.log..."
    rm wcc_srv$FROM.log
    echo "downloading http://srv$FROM.com:7080/logs/wcc.log ..."
    curl http://srv$FROM.com:7080/logs/wcc.log --output wcc_srv$FROM.log
    ((FROM++))
done
