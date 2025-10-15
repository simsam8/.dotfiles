#!/usr/bin/env bash

total="$(nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits)"
used="$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits)"
echo -e "$used/$total""MiB"
