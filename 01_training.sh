#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "error: I expect path to the config file (e.g. experiments/20230207_organ_simulator_fixed_camera/config.txt)"
    exit 1
fi

CONFIG_FILE=$1
echo "using config file [${CONFIG_FILE}]"

export CUDA_VISIBLE_DEVICES=0   # Specify GPU id
python run_endonerf.py --config ${CONFIG_FILE}
