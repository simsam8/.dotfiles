#!/usr/bin/env bash

# temp="$(nvidia-smi -q -d temperature | awk 'NR==11{print $5}')"
load="$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)"
echo -e "$load% "
