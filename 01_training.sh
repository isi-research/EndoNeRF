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
    echo "error: I expect path to the config file (e.g. experiments/20230207_organ_simulator_fixed_camera/config.txt)"
    exit 1
fi

CONFIG_FILE=$(realpath ${1})
echo "using config file [${CONFIG_FILE}]"
echo "using the endonerf sdk under [${DIR}]"

pushd .
cd $DIR

export CUDA_VISIBLE_DEVICES=0
python run_endonerf.py --config ${CONFIG_FILE}

popd
