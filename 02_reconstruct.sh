#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "error: I expect path to the config file (e.g. experiments/20230207_organ_simulator_fixed_camera/config.txt)"
    exit 1
fi

CONFIG_FILE=$1
echo "using config file [${CONFIG_FILE}]"

python endo_pc_reconstruction.py \
  --config_file $CONFIG_FILE \
  --n_frames 60 \
  --depth_smoother \
  --depth_smoother_d 28
