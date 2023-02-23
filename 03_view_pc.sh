#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "error: I expect path to the experiments point-cloud directory (e.g. experiments/pulling_soft_tissues/logs/pulling_soft_tissues/reconstructed_pcds_100000/)"
    exit 1
fi

PC_DIR=$1
echo "using pointcloud directory [${PC_DIR}]"

python vis_pc.py --pc_dir $PC_DIR