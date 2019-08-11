#!/usr/bin/env bash

for i in `seq 1 15`; do
    nc -z $1 $2 && echo Success && exit 0
    echo -n .
    sleep 1
done

echo
echo "Failed waiting for port $2 on host $1"
exit 1
