#!/usr/bin/env bash

# Check if argument provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <port>"
    exit 1
fi

port=$1

# Kill SSH tunnel for the specific port
pkill -f "ssh.*${port}:localhost:${port}"

echo "Stopped tunnel for port ${port}"
