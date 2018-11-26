#!/bin/bash

## Iterates over files and find a specific text

for file in ~/Documents/wcc_srv*;
do
    if [[ -f $file ]]; then
        if grep $1 $file -R > /dev/null 2>&1; then
            echo "Founded $1 in $file"
            if [ ! -z "$2" ] && [ "$2" = "detail" ]; then
                cat $file | grep $1
            fi
        else
            echo "$1 not founded in $file!"
        fi
    fi
done
