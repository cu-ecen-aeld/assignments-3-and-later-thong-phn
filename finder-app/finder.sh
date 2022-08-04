#!/bin/bash
# Author: thong-phn
filesdir=$1
searchstr=$2

# Check for the number of input args
if [ $# -ne 2 ]; then
    echo "USAGE: ./writer.sh <file_path> <string>"
    exit 1
fi

if [ ! -d $filesdir ]; then
    echo "ERROR: Not a Directory"
    exit 1
fi

# Find string
echo "The number of files are $(find $filesdir -type f | wc -l) and the number of matching lines are $(grep -r $searchstr $filesdir | wc -l)"

exit 0

