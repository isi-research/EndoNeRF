#!/usr/bin/env bash

export CUDA_VISIBLE_DEVICES=0   # Specify GPU id
python run_endonerf.py --config experiments/pulling_soft_tissues/config.txt