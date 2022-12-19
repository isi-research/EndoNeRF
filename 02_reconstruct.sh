#!/usr/bin/env bash

python endo_pc_reconstruction.py \
  --config_file "experiments/pulling_soft_tissues/config.txt" \
  --n_frames 60 \
  --depth_smoother \
  --depth_smoother_d 28
