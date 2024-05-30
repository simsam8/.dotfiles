#!/usr/bin/env bash

# temp="$(nvidia-smi -q -d temperature | awk 'NR==11{print $5}')"
temp="$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)"
echo -e "$temp°C "
