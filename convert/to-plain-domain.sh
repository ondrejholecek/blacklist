#!/bin/bash

filename="$1"
if [ -z "$filename" ]; then
	echo "Usage: $0 <originalFile>" >>/dev/stderr
	exit 1
fi

newname="plain-$1"

cat $filename | awk '$1 == "0.0.0.0" { print $2 }' | grep -v -f exclude-$1 >$newname

echo "Converted $filename to $newname"
