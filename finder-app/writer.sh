#!/bin/bash
writefile=$1
writestr=$2


# Check for the number of input args
if [ $# -ne 2 ]; then
    echo "USAGE: ./writer.sh <writefile> <writestr>"
    exit 1
fi

# Make dir and write
mkdir -p "$(dirname $writefile)"
touch $writefile

if [ $? -ne 0 ]; then
    echo "ERROR: File could not be created"
    exit 1
else
    echo $writestr > $writefile
    exit 0
fi