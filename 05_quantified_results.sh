#!/usr/bin/env bash

python eval_rgb.py \
    --gt_dir dataset/pulling_soft_tissues/images \
    --mask_dir dataset/pulling_soft_tissues/gt_masks \
    --img_dir experiments/pulling_soft_tissues/logs/pulling_soft_tissues/renderonly_path_fixidentity_100000/estim/