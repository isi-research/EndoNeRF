#!/usr/bin/env bash

get_current_dir() {
  SOURCE="${BASH_SOURCE[0]}"

  # resolve $SOURCE until the file is no longer a symlink
  while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    # if $SOURCE was a relative symlink, we need to resolve it relative to
    # the path where the symlink file was located
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
}

get_current_dir

if [ "$#" -ne 1 ]; then
    echo "error: I expect path to the experiments point-cloud directory (e.g. experiments/pulling_soft_tissues/logs/pulling_soft_tissues/reconstructed_pcds_100000/)"
    exit 1
fi

PC_DIR=$(realpath ${1})
echo "using pointcloud directory [${PC_DIR}]"
echo "using the endonerf sdk under [${DIR}]"

pushd .
cd $DIR

export CUDA_VISIBLE_DEVICES=0
python vis_pc.py --pc_dir $PC_DIR

popd