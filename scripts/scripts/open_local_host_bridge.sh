#!/usr/bin/env bash


# Check if argument provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <port>"
    exit 1
fi

port=$1

ssh -NfL ${port}:localhost:${port} homelab && xdg-open http://localhost:${port}
